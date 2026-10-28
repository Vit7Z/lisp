;///////// ѕараметр последующий ///////////////////////////////////////////////////////////////////
(defun c:03-parametr-02

( / adoc angle-mtxt len-mtxt pnt-2 pnt-ins pnt-lin2 pnt-mtxt txt-1 txt-2 xpnt-ins ypnt-2 ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 6199)
(setvar	"textstyle" "Standard")







(while (/= (setq pnt-ins (getpoint "\n”кажите нижнюю точку предыдущего параметра\n")) nil)

	(setq pnt-2 (getpoint "\n”кажите верхнюю точку предыдущего параметра\n")

   			xpnt-ins (+ (nth 0 pnt-ins) 8)
		    ypnt-ins (nth 1 pnt-ins)
		    ypnt-2 (nth 1 pnt-2)
			    
		    len-mtxt (abs (- ypnt-ins ypnt-2))
			    	    
		    pnt-ins (list xpnt-ins ypnt-ins)
		    pnt-lin2 (list xpnt-ins ypnt-2)
		    pnt-mtxt (list (- xpnt-ins 0.5) (+ ypnt-ins 2))
		    angle-mtxt (angtof "90" 0)
  );setq
     
  (setvar "osmode" 0)
    
  (command "_line" pnt-ins pnt-lin2 "")

	(setq txt-1
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 pnt-lin2) ; нач точка текста
				 (cons 11 pnt-lin2) ; нач точка текста
				'(1 . "****") ; содержание текста
				'(40 . 2.5) ; высота текста
				'(41 . 1) ; раст€жение текста
				'(50 . 0) ; поворот текста
				'(72 . 1) ; гориз выравнивание текста
				'(73 . 1) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				(cons 7 "Standard")
			);list
		);entmakex
	);setq
	 
	 
		
	(setq txt-2
		(entmakex
			(list
				'(0 . "MTEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbMText")
				(cons 10 pnt-mtxt) ; нач точка текста
				'(1 . "*******") ; содержание текста
				(cons 50 angle-mtxt) ; угол в радианах
				'(40 . 2.5) ; высота текста
				(cons 41 len-mtxt) ; раст€жение текста
				(cons 42 len-mtxt) ; ширина текста
				'(71 . 7) ; гориз выравнивание текста, вниз влево
				'(370 . -1) ; толщина текста
				(cons 7 "Standard")
			);list
		);entmakex
	);setq

  (setvar "osmode" 6199)
);while

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////
