

;(defparameter *NotoRegular16* nil)
(defparameter *NotoBold16*    nil)
(defparameter *NotoBlack16*   nil)

(defun main ()
  (sdl:with-init ()
    (sdl:window 640 480 :title-caption "test" ) 
    (setf (sdl:frame-rate) 60)

    ;;; *default-font*は*NotoRegular16*に設定すみ
    (sdl:fill-surface sdl:*white* :surface sdl:*default-display*)
    (unless (sdl:initialise-default-font *default-font*)
      (error "FONT-EXAMPLE: Cannot initialize the default font."))

    ;;;; 以下、(sdl:draw-string-* :font xxx) で使用するフォントオブジェクト
    ;;;; これはwith-init内で宣言する必要あり。
;    (setf *NotoRegular16*
;      (sdl:initialise-font *ttc-font-NotoRegular16*))
    (setf *NotoBold16*
      (sdl:initialise-font *ttc-font-NotoBold16*))
    (setf *NotoBlack16*
      (sdl:initialise-font *ttc-font-NotoBlack16*))
    
    
;;;; 以下の2つは、*default-font*(*NotoRegular16*)で描かれる。
    
    (draw-string "あめんぼあかいな あいうえお" 0 0)
    (draw-string-* "*** 東京特許許可局 ****" 0 2 sdl:*black* sdl:*white*)

    (sdl:draw-string-solid-* "いぬねこかわいい" 0 100 :color sdl:*black*)

    (sdl:draw-string-solid-* "ちよりんきなこ かわいい" 0 170 :color sdl:*blue* :font *NotoBold16*)
    
    (sdl:draw-string-solid-* "いぬねこかわいい" 0 140 :color sdl:*black* :font *NotoBlack16* )
    ;; (sdl:draw-string-solid-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 0
    ;;                          :color sdl:*black*)
    ;; (sdl:draw-string-shaded-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 32
    ;;                           sdl:*black*
    ;;                           sdl:*yellow*)
    ;; (sdl:draw-string-blended-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 64
    ;;                            :color sdl:*black*)
    (sdl:draw-box-* 0 16 64 1 :color sdl:*red*)
    
    (sdl:update-display)    

    (sdl:with-events ()
      (:quit-event() t)
      (:key-down-event (:key key)
		       (when (sdl:key= key :sdl-key-escape )
			 (sdl:push-quit-event)))
      (:idle ()
	     (sdl:update-display )))))
;	     (princ "a")))))
