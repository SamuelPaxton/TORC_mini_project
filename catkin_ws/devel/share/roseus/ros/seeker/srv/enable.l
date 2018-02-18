;; Auto-generated. Do not edit!


(when (boundp 'seeker::enable)
  (if (not (find-package "SEEKER"))
    (make-package "SEEKER"))
  (shadow 'enable (find-package "SEEKER")))
(unless (find-package "SEEKER::ENABLE")
  (make-package "SEEKER::ENABLE"))
(unless (find-package "SEEKER::ENABLEREQUEST")
  (make-package "SEEKER::ENABLEREQUEST"))
(unless (find-package "SEEKER::ENABLERESPONSE")
  (make-package "SEEKER::ENABLERESPONSE"))

(in-package "ROS")





(defclass seeker::enableRequest
  :super ros::object
  :slots (_data ))

(defmethod seeker::enableRequest
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass seeker::enableResponse
  :super ros::object
  :slots (_success _message ))

(defmethod seeker::enableResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass seeker::enable
  :super ros::object
  :slots ())

(setf (get seeker::enable :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get seeker::enable :datatype-) "seeker/enable")
(setf (get seeker::enable :request) seeker::enableRequest)
(setf (get seeker::enable :response) seeker::enableResponse)

(defmethod seeker::enableRequest
  (:response () (instance seeker::enableResponse :init)))

(setf (get seeker::enableRequest :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get seeker::enableRequest :datatype-) "seeker/enableRequest")
(setf (get seeker::enableRequest :definition-)
      "bool data
---
bool success
string message

")

(setf (get seeker::enableResponse :md5sum-) "09fb03525b03e7ea1fd3992bafd87e16")
(setf (get seeker::enableResponse :datatype-) "seeker/enableResponse")
(setf (get seeker::enableResponse :definition-)
      "bool data
---
bool success
string message

")



(provide :seeker/enable "09fb03525b03e7ea1fd3992bafd87e16")


