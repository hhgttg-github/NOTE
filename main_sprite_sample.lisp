(defun main ()
  (sdl:with-init ()
    (sdl:window +screen-width+ +screen-height+
		:title-caption "スプライト テスト" ) 
    (setf (sdl:frame-rate) 60)
    (init-bg "/home/kawabe/lisp/NOTE/lispbuilder/background_lightblue.png")

    (let ((sheet16 (make-sp-sheet
		      "/home/kawabe/lisp/NOTE/lispbuilder/16x16sct.png" 16))
	  (sp-list nil))
      (setf sp-list
	    (cons (make-sprite sheet16
			       17
			       640 0 -64 32)
		  sp-list))
      (init-animate (car sp-list) :a 2)
      (new-frames (car sp-list) :a '(17 18 19))
      (sdl:draw-surface-at-* *bg* 0 0)
      (draw-sprite-list sp-list)
    
      (sdl:update-display)
    
      (sdl:with-events ()
	(:quit-event() t)
	(:key-down-event (:key key)
			 (when (sdl:key= key :sdl-key-escape )
			   (sdl:push-quit-event)))
	(:idle ()
	       (update-sprite-list sp-list)
	       (sdl:draw-surface-at-* *bg* 0 0)
	       (draw-sprite-list sp-list)
	       ;; (format t "frame ~a f-num ~a id ~a~%"
	       ;; 	       (frame (car sp-list))
	       ;; 	       (f-num (car sp-list))
	       ;; 	       (nth (f-num (car sp-list))
;;			    (get-current-frames (car sp-list))))
	       (sdl:update-display )
	       (incf *frame-count*))))))
