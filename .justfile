# Global justfile.
# https://just.systems/man/en/global-and-user-justfiles.html
#
# This is pretty equivalent to defining shell aliases, but it has a
# few advantages:
#
# * It includes code completion, even showing doc comments.
# * (minor) It works in both bash and zsh.

default:
    @just --list
