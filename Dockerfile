FROM jenkins/jenkins:lts

USER jenkins
RUN jenkins-plugin-cli --plugins \
    configuration-as-code \
    cloudbees-folder \
    configuration-as-code \
    credentials \
    github \
    instance-identity \
    job-dsl \
    script-security \
    structs \
    role-strategy \
    ws-cleanup