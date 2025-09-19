(defun main ()
  (sdl:with-init ()
    (sdl:window 640 480 :title-caption "test" ) 
    (setf (sdl:frame-rate) 60)

    (sdl:fill-surface sdl:*white* :surface sdl:*default-display*)
    (unless (sdl:initialise-default-font *default-font*)
      (error "FONT-EXAMPLE: Cannot initialize the default font."))
    (sdl:draw-string-solid-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 0
                             :color sdl:*black*)
    (sdl:draw-string-shaded-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 32
                              sdl:*black*
                              sdl:*yellow*)
    (sdl:draw-string-blended-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 64
                               :color sdl:*black*)
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
