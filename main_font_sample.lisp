(defun main ()
  (sdl:with-init ()
    (sdl:window 640 480 :title-caption "test" ) 
    (setf (sdl:frame-rate) 60)

    (sdl:fill-surface sdl:*white* :surface sdl:*default-display*)
    (unless (sdl:initialise-default-font *default-font*)
      (error "FONT-EXAMPLE: Cannot initialize the default font."))

;;;; 以下の2つは、*default-font*(*NotoRegular16*)で描かれる。
    
    (draw-string "あめんぼあかいな あいうえお" 0 0)
    (draw-string-* "*** 東京特許許可局 ****" 0 1 sdl:*black* sdl:*white*)

    ;; (sdl:draw-string-solid-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 0
    ;;                          :color sdl:*black*)
    ;; (sdl:draw-string-shaded-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 32
    ;;                           sdl:*black*
    ;;                           sdl:*yellow*)
    ;; (sdl:draw-string-blended-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 64
    ;;                            :color sdl:*black*)
    (sdl:draw-box-* 0 16 64 1 :color sdl:*red*)

;;;; 以下の1つは、*NotoBlack16*で描かれる。sdl:draw-string-*を直接呼びだしている。
    
    (sdl:draw-string-solid-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 160
			     :font *NotoBlack16*
                             :color sdl:*black*)

    ;; (sdl:draw-string-solid-* "あめんぼあかいな Text UTF8-Solid 日本語テスト" 0 96
    ;; 			     :font *ttc-font-NotoBlack16*
    ;;                          :color sdl:*black*)
    
    (sdl:update-display)    

    (sdl:with-events ()
      (:quit-event() t)
      (:key-down-event (:key key)
		       (when (sdl:key= key :sdl-key-escape )
			 (sdl:push-quit-event)))
      (:idle ()
	     (sdl:update-display )))))
;	     (princ "a")))))
