; Auto-generated. Do not edit!


(cl:in-package seeker-srv)


;//! \htmlinclude enable-request.msg.html

(cl:defclass <enable-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass enable-request (<enable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <enable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'enable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seeker-srv:<enable-request> is deprecated: use seeker-srv:enable-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <enable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seeker-srv:data-val is deprecated.  Use seeker-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <enable-request>) ostream)
  "Serializes a message object of type '<enable-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'data) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <enable-request>) istream)
  "Deserializes a message object of type '<enable-request>"
    (cl:setf (cl:slot-value msg 'data) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<enable-request>)))
  "Returns string type for a service object of type '<enable-request>"
  "seeker/enableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'enable-request)))
  "Returns string type for a service object of type 'enable-request"
  "seeker/enableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<enable-request>)))
  "Returns md5sum for a message object of type '<enable-request>"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'enable-request)))
  "Returns md5sum for a message object of type 'enable-request"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<enable-request>)))
  "Returns full string definition for message of type '<enable-request>"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'enable-request)))
  "Returns full string definition for message of type 'enable-request"
  (cl:format cl:nil "bool data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <enable-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <enable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'enable-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude enable-response.msg.html

(cl:defclass <enable-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass enable-response (<enable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <enable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'enable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name seeker-srv:<enable-response> is deprecated: use seeker-srv:enable-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <enable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seeker-srv:success-val is deprecated.  Use seeker-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <enable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader seeker-srv:message-val is deprecated.  Use seeker-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <enable-response>) ostream)
  "Serializes a message object of type '<enable-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <enable-response>) istream)
  "Deserializes a message object of type '<enable-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<enable-response>)))
  "Returns string type for a service object of type '<enable-response>"
  "seeker/enableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'enable-response)))
  "Returns string type for a service object of type 'enable-response"
  "seeker/enableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<enable-response>)))
  "Returns md5sum for a message object of type '<enable-response>"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'enable-response)))
  "Returns md5sum for a message object of type 'enable-response"
  "09fb03525b03e7ea1fd3992bafd87e16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<enable-response>)))
  "Returns full string definition for message of type '<enable-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'enable-response)))
  "Returns full string definition for message of type 'enable-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <enable-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <enable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'enable-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'enable)))
  'enable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'enable)))
  'enable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'enable)))
  "Returns string type for a service object of type '<enable>"
  "seeker/enable")