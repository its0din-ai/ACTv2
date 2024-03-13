import os
import subprocess
from glob import glob

BLACKLIST = ['__pycache__', '.git', 'ARCHIVE', 'mailer', 'platform', 'SSL']

def list_projects(project_dir):
    project_path = os.path.join(os.getcwd(), project_dir)
    return [os.path.join(project_path, subdir) for subdir in os.listdir(project_path)
            if os.path.isdir(os.path.join(project_path, subdir)) and subdir not in BLACKLIST]

def up(project_dir):
    project_path = os.path.join(os.getcwd(), project_dir)
    docker_compose_file = os.path.join(project_path, 'docker-compose.yml')
    if os.path.exists(docker_compose_file):
        subprocess.run(['docker-compose', 'up', '-d'], cwd=project_path)
    else:
        print(f"[SKIPPED] '{project_dir}' does not have docker-compose.yml")

def down(project_dir):
    project_path = os.path.join(os.getcwd(), project_dir)
    if os.path.exists(os.path.join(project_path, 'docker-compose.yml')):
        subprocess.run(['docker-compose', 'down'], cwd=project_path)
    else:
        print(f"[SKIPPED] '{project_dir}' does not have docker-compose.yml")

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description="Deploy Manager")
    parser.add_argument('command', metavar='COMMAND', help="Command (e.g., UP, DOWN, LIST)")
    parser.add_argument('project_pattern', nargs='?', default='*',
                        help="Project directory pattern (e.g., WEB/*, ALL)")
    args = parser.parse_args()

    if args.command.upper() == 'LIST':
        projects = list_projects(args.project_pattern)
        if projects:
            print("Found projects:")
            for project in projects:
                print(f"- {project}")
        else:
            print("No matching project directories found.")
    elif args.command.upper() in ('UP', 'DOWN'):
        if args.project_pattern == 'ALL':
            projects = list_projects('')
            for project in projects:
                print(project)
                valid = list_projects(project + '/')
                for process in valid:
                    if args.command.upper() == 'UP':
                        up(process)
                    else:
                        down(process)
    else:
        print(f"Unsupported command '{args.command}'")
