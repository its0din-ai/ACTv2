from flask import Flask, render_template, render_template_string, redirect, url_for, request, flash
from flask_login import LoginManager, UserMixin, login_user, login_required, logout_user, current_user
from lxml import etree

app = Flask(__name__)
app.config['SECRET_KEY'] = 'LZQFNxTxE17EplQRjnoQfNyG0yMMp5T4'
app.config['DEV_ACCOUNT'] = 'administrator'
app.config['DEV_PASSWORD'] = '''EFSCWJ~jHCzLB~E-w,Y}O;V9ckYD!Ob=)'A6_tVi1[VvNiE@0w'''
app.config['FLAG_LOCATION'] = '/bendera.pem'

login_manager = LoginManager(app)
login_manager.login_view = 'login'
class User(UserMixin):
    def __init__(self, user_id, username, name):
        self.id = user_id
        self.username = username
        self.name = name

users = {'0': {'id': '0', 'username': app.config['DEV_ACCOUNT'], 'password': app.config['DEV_PASSWORD'], 'name': 'Administrator', 'img': 'https://i.stack.imgur.com/34AD2.jpg'},
         '1': {'id': '1', 'username': 'dummy', 'password': 'dumb', 'name':'Dumb', 'img': 'https://i.stack.imgur.com/34AD2.jpg'},
         '2': {'id': '2', 'username': 'risdu', 'password': 'FMa0ArKlSlbR', 'name':'Ayunda Risu', 'img': 'https://hololist.net/wp-content/uploads/2022/02/ayunda-risu-portrait-66-300x300.jpg'},
         '3': {'id': '3', 'username': 'itsmoona', 'password': 'VOilHUreOprf', 'name':'Moona Hoshinova', 'img': 'https://hololist.net/wp-content/uploads/2022/02/moona-hoshinova-portrait-66-300x300.jpg'},
         '4': {'id': '4', 'username': '0x1337', 'password': 'a6r2g91eyDix', 'name': 'Vestia Zeta', 'img': 'https://hololist.net/wp-content/uploads/2022/03/vestia-zeta-portrait-66-300x300.jpg'},
         '5': {'id': '5', 'username': 'kovalskia', 'password': 'a6r2g91eyDix', 'name': 'Kaela Kovalskia', 'img': 'https://hololist.net/wp-content/uploads/2022/03/kaela-kovalskia-portrait-66-300x300.jpg'},
         '6': {'id': '6', 'username': 'kobokanaeru_', 'password': 'a6r2g91eyDix', 'name': 'Kobo Kanaeru', 'img': 'https://hololist.net/wp-content/uploads/2022/03/kobo-kanaeru-portrait-66-300x300.jpg'},
         '7': {'id': '7', 'username': 'alien.id', 'password': 'a6r2g91eyDix', 'name': 'Airani Iofifteen', 'img': 'https://hololist.net/wp-content/uploads/2022/02/airani-iofifteen-portrait-66-300x300.jpg'},}

@login_manager.user_loader
def load_user(user_id):
    user_data = users.get(user_id)
    if user_data:
        return User(user_data['id'], user_data['username'], user_data['name'])
    return None

@app.route('/')
def index():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = next((user for user in users.values() if user['username'] == username and user['password'] == password), None)
        if user:
            user_obj = User(user['id'], user['username'], user['name'])
            login_user(user_obj)
            return redirect(url_for('dashboard'))
        else:
            flash('Login Gagal! pastikan username dan password sesuai.', 'danger')
    return render_template('login.html')

@app.route('/dashboard', methods=['GET', 'POST'])
@login_required
def dashboard():
    errr = ''
    users_list = list(users.values())  # Assuming 'users' is a dictionary containing user data
    selected_user = None
    
    ssti_blacklist = ['{', '}', 'config', 'self', 'request', 'session', 'g', 'url_for', 'redirect', 'current_user', 'login_user', 'login_required', 'logout_user', 'load_user', 'User', 'users', 'login_manager', 'app', 'render_template', 'render_template_string', 'flash', 'etree', 'xml_content', 'parser', 'doc', 'account_elem', 'firstElement', 'secondElement', 'uploaded_file', 'err', 'to', 'pesan', 'errr', 'user', 'user_obj', 'user_id', 'username', 'password', 'user_data']

    if request.method == 'POST':
        search_name = request.form.get('search_name', '')
        selected_user = next((user for user in users_list if user['username'].lower() == search_name.lower()), None)
        if not selected_user:
            if any([blacklist in search_name for blacklist in ssti_blacklist]):
                errr = "nyari SSTI bang? ada kok, coba try harder. btw nih result lo: %s" % search_name
            else:
                errr = "User not found: %s" % search_name

    return render_template('dashboard.html', users_list=users_list, selected_user=selected_user, errr=errr)


@app.errorhandler(404)
def page_not_found(e):
    template = '''{%% block body %%}
    <h4>PATH %s NOT FOUND</h4>
    {%% endblock %%}
    ''' % (request.path)
    return render_template_string(template), 404

@app.route('/static/<path:filename>')
def download_file(filename):
    directory = '/static'
    response = send_from_directory(directory, filename)
    response.headers["Content-Disposition"] = f"attachment; filename={filename}"
    return response

@app.route('/fans', methods=['GET', 'POST'])
@login_required
def fans():
    if current_user.username != app.config['DEV_ACCOUNT']:
        return redirect(url_for('dashboard'))
    else:
        parsed_xml = None
        # to = '[DEBUG] - TO'
        # pesan = '[DEBUG] - PESAN'
        # err = '[DEBUG] - ERR'
        to = None
        pesan = None
        err = None
        if request.method == 'POST':
            uploaded_file = request.files['fansletter']
            file_type = uploaded_file.content_type
            if uploaded_file.filename != '':
                if file_type != 'text/xml':
                    err = "Error: \n\nFile yang diupload harus berformat XML!"
                else:
                    try:
                        xml_content = uploaded_file.read().decode('utf-8')
                        parser = etree.XMLParser(no_network=False)
                        doc = etree.fromstring(xml_content.encode('utf-8'), parser)
                        account_elem = doc.find('.//letter')
                        if account_elem is not None:
                            firstElement = account_elem.find('to')
                            secondElement = account_elem.find('pesan')
                            if firstElement is not None and secondElement is not None:
                                to = firstElement.text
                                pesan = secondElement.text
                            else:
                                err = "Error: \n\nTujuan dan Pesan tidak ditemukan didalam Surat!"
                        else:
                            err = "Error: \n\nSurat tidak terdeteksi!"
                    except etree.XMLSyntaxError as e:
                        err = "Error:\n\n{}".format(str(e))
        return render_template('fans.html', to=to, pesan=pesan, err=err)

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash('Logged out successfully', 'success')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)