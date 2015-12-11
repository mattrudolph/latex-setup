# latex-setup
Personal setup files for my latex documents, including LHCb bib files

Creates a fresh texmf tree, so clone with:

    git clone https://github.com/mattrudolph/latex-setup.git texmf

in the directory that your system expects the local texmf tree.

To use my beamer talk template, run the newpres.sh script with options like:

    newpres.sh dirname "Title of the talk" MM DD YY [force]
    
Anything as a 6th option [force] will delete the target dirname first before creating a new directory