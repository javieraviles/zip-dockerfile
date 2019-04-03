ZIP Docker image
====================
This image is used for deployment and utility purposes. ZIP utility is installed.


## Where it can be useful:
The idea is to have a clean alpine image with ZIP utility so certain stages of a CI pipeline can run make use of the utility.

Use this container anywhere you need to use ZIP utility.

## How to use it inside a Jenkins pipeline
```
stage('get the code') {
    agent {
        docker {
            image 'any-image-needed-to-do-this'
            reuseNode true
        }
    }
    steps {
        ...
        // checkout code from git?
        // build assets
        // unit tests?
    }
}
stage('ZIP directory to be uploaded or unzip something') {
    agent {
        docker {
            image 'javieraviles/zip'
            reuseNode true
        }
    }
    steps {
        echo "[INFO] Creating zip file..."
	    
        sh "zip -r ${PROJECT_NAME}.zip zip_file_name -x \".ignored-file\"; ls -al;"
    }
}
```