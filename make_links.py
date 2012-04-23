#!/usr/bin/env python

import os


class FileExists(OSError): pass

def create_symlink(source_path, target):
    try:
        os.symlink(source_path, target)
    except OSError as e:
        if e.errno == 17: # file exists
            raise FileExists()
        else:
            # re-raise original exception
            raise
        

def is_configuration_file(file_name):
    # skip .git files specific to the repo
    if file_name in ['.git', '.gitignore']:
        return False

    # emacs backup files
    if file_name.startswith('.#'):
        return False
    
    if file_name.startswith('.'):
        return True

    return False


def get_configuration_file_names(path):
    for file_name in os.listdir(path):
        if is_configuration_file(file_name):
            
            yield file_name


if __name__ == '__main__':
    home_path = os.path.expanduser('~')
    dotfiles_path = os.getcwd()

    for file_name in get_configuration_file_names(dotfiles_path):
        source_path = os.path.join(dotfiles_path, file_name)
        target_path = os.path.join(home_path, file_name)
        
        try:
            create_symlink(source_path, target_path)
            print("Linking %s to %s" % (source_path, target_path))
        except FileExists:
            print("There is already a file at %s, skipping." % target_path)


