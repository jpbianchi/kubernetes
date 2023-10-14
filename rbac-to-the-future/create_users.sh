# location for cert keys
mkdir user_certs && cd user_certs

# create Jesus certs
openssl genrsa -out Jesus.key 2048
openssl req -new -key Jesus.key -out Jesus.csr -subj "/CN=Jesus/O=Jesus"
openssl x509 -req -in Jesus.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out Jesus.crt -days 10

# create Joey certs
openssl genrsa -out Joey.key 2048
openssl req -new -key Joey.key -out Joey.csr -subj "/CN=Joey/O=Joey"
openssl x509 -req -in Joey.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out Joey.crt -days 10

# create Jessica certs
openssl genrsa -out Jessica.key 2048
openssl req -new -key Jessica.key -out Jessica.csr -subj "/CN=Jessica/O=Jessica"
openssl x509 -req -in Jessica.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out Jessica.crt -days 10

# create Jules certs
openssl genrsa -out Jules.key 2048
openssl req -new -key Jules.key -out Jules.csr -subj "/CN=Jules/O=Jules"
openssl x509 -req -in Jules.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out Jules.crt -days 10

# create user and contexts necessary
kubectl config set-credentials Jesus --client-certificate=Jesus.crt --client-key=Jesus.key
kubectl config set-context Jesus-context --user=Jesus --cluster=minikube

kubectl config set-credentials Joey --client-certificate=Joey.crt --client-key=Joey.key
kubectl config set-context Joey-context --user=Joey --cluster=minikube

kubectl config set-credentials Jessica --client-certificate=Jessica.crt --client-key=Jessica.key
kubectl config set-context Jessica-context --user=Jessica --cluster=minikube

kubectl config set-credentials Jules --client-certificate=Jules.crt --client-key=Jules.key
kubectl config set-context Jules-context --user=Jules --cluster=minikube

# sh create_users.sh 
# Generating RSA private key, 2048 bit long modulus (2 primes)
# ........................................................................................+++++
# .+++++
# e is 65537 (0x010001)
# Signature ok
# subject=CN = Jesus, O = Jesus
# Getting CA Private Key
# Generating RSA private key, 2048 bit long modulus (2 primes)
# ........+++++
# .........................................+++++
# e is 65537 (0x010001)
# Signature ok
# subject=CN = Joey, O = Joey
# Getting CA Private Key
# Generating RSA private key, 2048 bit long modulus (2 primes)
# .....................................................................................................+++++
# ..............................................................................................+++++
# e is 65537 (0x010001)
# Signature ok
# subject=CN = Jessica, O = Jessica
# Getting CA Private Key
# Generating RSA private key, 2048 bit long modulus (2 primes)
# ..................+++++
# ............+++++
# e is 65537 (0x010001)
# Signature ok
# subject=CN = Jules, O = Jules
# Getting CA Private Key
# User "Jesus" set.
# Context "Jesus-context" created.
# User "Joey" set.
# Context "Joey-context" created.
# User "Jessica" set.
# Context "Jessica-context" created.
# User "Jules" set.
# Context "Jules-context" created.

# kubectl config view
# apiVersion: v1
# clusters:
# - cluster:
#     certificate-authority: /home/codespace/.minikube/ca.crt
#     extensions:
#     - extension:
#         last-update: Thu, 12 Oct 2023 15:52:00 UTC
#         provider: minikube.sigs.k8s.io
#         version: v1.31.2
#       name: cluster_info
#     server: https://192.168.49.2:8443
#   name: minikube
# contexts:
# - context:
#     cluster: minikube
#     user: Jessica
#   name: Jessica-context
# - context:
#     cluster: minikube
#     user: Jesus
#   name: Jesus-context
# - context:
#     cluster: minikube
#     user: Joey
#   name: Joey-context
# - context:
#     cluster: minikube
#     user: Jules
#   name: Jules-context
# - context:
#     cluster: minikube
#     extensions:
#     - extension:
#         last-update: Thu, 12 Oct 2023 15:52:00 UTC
#         provider: minikube.sigs.k8s.io
#         version: v1.31.2
#       name: context_info
#     namespace: default
#     user: minikube
#   name: minikube
# current-context: minikube
# kind: Config
# preferences: {}
# users:
# - name: Jessica
#   user:
#     client-certificate: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jessica.crt
#     client-key: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jessica.key
# - name: Jesus
#   user:
#     client-certificate: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jesus.crt
#     client-key: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jesus.key
# - name: Joey
#   user:
#     client-certificate: /workspaces/kubernetes/rbac-to-the-future/user_certs/Joey.crt
#     client-key: /workspaces/kubernetes/rbac-to-the-future/user_certs/Joey.key
# - name: Jules
#   user:
#     client-certificate: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jules.crt
#     client-key: /workspaces/kubernetes/rbac-to-the-future/user_certs/Jules.key
# - name: minikube
#   user:
#     client-certificate: /home/codespace/.minikube/profiles/minikube/client.crt
#     client-key: /home/codespace/.minikube/profiles/minikube/client.key

# kubectl config get-contexts
# CURRENT   NAME              CLUSTER    AUTHINFO   NAMESPACE
#           Jessica-context   minikube   Jessica    
#           Jesus-context     minikube   Jesus      
#           Joey-context      minikube   Joey       
# *         Jules-context     minikube   Jules      
#           minikube          minikube   minikube   default