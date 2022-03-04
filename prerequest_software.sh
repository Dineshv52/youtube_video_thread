#!/bin/bash
os_name=$(uname -s)
echo "$os_name"
value=`pwd`
if [ "$os_name" == "Darwin" ]
then
    echo "downloading prerequisites for mac"
    echo "downloading chromedriver version 98.0.0"
    curl -O https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_mac64.zip
    unzip chromedriver_mac64.zip
    sudo mv chromedriver /usr/local/bin/chromedriver
    sudo chmod +x /usr/local/bin/chromedriver
    python3 --version
    if [ $? -eq 0 ]
    then
        echo "python3 found"
        pip3 install -r requirements.txt
    else
        echo "installing python3"
        brew install python3
        pip3 --version
        if [ $? -eq 0 ]
        then
            echo "installing pip3"
            curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
            python3 get-pip.py
            if [ $? -eq 0 ]
            then
                echo "pip3 installation failed"
                exit 1
            else
                echo "pip3 installation success"
                cd $value
                pip3 install -r requirements.txt
            fi
        else
            echo "already installed pip3"
        fi
    fi
else
    echo "os is linux"
    echo "downloading prerequisites for linux"
    echo "downloading chromedriver version 98.0.0"
    curl -O https://chromedriver.storage.googleapis.com/98.0.4758.102/chromedriver_linux64.zip
    unzip chromedriver_linux64.zip
    sudo mv chromedriver /usr/local/bin/chromedriver
    sudo chmod +x /usr/local/bin/chromedriver
    python3 --version
    if [ $? -eq 0 ]
    then
        echo "python3 found"
        pip3 install -r requirements.txt
    else
        echo "installing python3"
        brew install python3
        pip3 --version
        if [ $? -eq 1 ]
        then
            echo "installing pip3"
            curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
            python3 get-pip.py
            if [ $? -eq 1 ]
            then
                echo "pip3 installation failed"
                exit 1
            else
                echo "pip3 installation success"
                cd $value
                pip3 install -r requirements.txt
            fi
        else
            echo "already installed pip3"
        fi
    fi

fi