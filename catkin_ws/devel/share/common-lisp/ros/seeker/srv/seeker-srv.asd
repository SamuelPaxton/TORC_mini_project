
(cl:in-package :asdf)

(defsystem "seeker-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "enable" :depends-on ("_package_enable"))
    (:file "_package_enable" :depends-on ("_package"))
  ))