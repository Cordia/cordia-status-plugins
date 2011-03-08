#!/bin/sh
#
# Generate config.vapi from config.h
#
(
echo '// config.vapi.  Generated from config.h by autovapi.sh.'
echo '[CCode (cheader_filename = "config.h")]'
echo 'namespace Config {'
sed -ne 's/#define \(HAVE_[A-Z_]*\) \([0-9]*\)$/\t\[CCode (cname = \"\1\"\)]\n\tconst bool \1;/p' -e 's/#define \([A-Z_]*\) \([0-9]*\)$/\t\[CCode (cname = \"\1\"\)]\n\tconst int \1;/p' -e 's/#define \([A-Z_]*\) \(\".*\"\)$/\t\[CCode (cname = \"\1\"\)]\n\tconst string \1;/p' < config.h
echo '}'
) > vapi/config.vapi
