#!/usr/bin/env python3

import os
import sys


class FileExists(OSError): pass

def create_symlink(source_path, target, overwrite=False):
    if os.path.exists(target):
        if overwrite:
            os.unlink(target)
        else:
            raise FileExists()

    elif os.path.islink(target):
        # It's a broken symlink.
        if overwrite:
            os.unlink(target)
        else:
            raise FileExists("Broken symlink exists")

    target_parent = os.path.dirname(target)
    if not os.path.exists(target_parent):
        os.makedirs(target_parent)

    os.symlink(source_path, target)


def is_configuration_file(path):
    file_name = os.path.basename(path)
    
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
        absolute_path = os.path.join(path, file_name)
        
        if is_configuration_file(absolute_path):

            if os.path.isdir(absolute_path):
                for nested_file_name in os.listdir(absolute_path):
                    yield os.path.join(file_name, nested_file_name)
            else:
                yield file_name


if __name__ == '__main__':
    home_path = os.path.expanduser('~')

    script_path = os.path.realpath(__file__)
    dotfiles_path = os.path.dirname(script_path)

    overwrite = False
    if '--force' in sys.argv:
        overwrite = True

    for file_name in get_configuration_file_names(dotfiles_path):
        source_path = os.path.join(dotfiles_path, file_name)
        target_path = os.path.join(home_path, file_name)

        try:
            create_symlink(source_path, target_path, overwrite)
            print("Linking %s to %s" % (source_path, target_path))
        except FileExists:
            print("There is already a file at %s, skipping." % target_path)

    # Symlink files from bin directory to ~/bin
    bin_source_dir = os.path.join(dotfiles_path, 'bin')
    bin_target_dir = os.path.join(home_path, 'bin')

    for file_name in os.listdir(bin_source_dir):
        source_path = os.path.join(bin_source_dir, file_name)
        target_path = os.path.join(bin_target_dir, file_name)

        try:
            create_symlink(source_path, target_path, overwrite)
            print("Linking bin %s to %s" % (source_path, target_path))
        except FileExists:
            print("There is already a file at %s, skipping." % target_path)


