(in-package #:nyxt-user)

(define-configuration password:keepassxc-interface
  ((password:password-file "/home/jy/Documents/passwd.txt")))

(define-configuration buffer
  ((password-interface (make-instance 'password:user-keepassxc-interface))))
