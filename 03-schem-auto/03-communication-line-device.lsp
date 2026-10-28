;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// Линия связи на приборе                                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////

(defun c:03-communication-line-device

( / adoc align-72 align-73 angl pnt-drctn pnt-ins pnt-lin2 txt-1 xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
) ; start undo

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				pnt-drctn (getpoint "\nУкажите точку направления\n")
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
	);setq

	; опеределяем угол поворота
	(cond
		; вниз						 
		((and (<= angl 315) (>= angl 225));and
			(setq pnt-lin2 (list xpnt-ins (- ypnt-ins 5))
						align-72 1
						align-73 3
			);setq
		);end условия
		
		;влево
		((and (<= angl 225) (>= angl 135));and
			(setq pnt-lin2 (list (- xpnt-ins 5) ypnt-ins)
						align-72 2
						align-73 2
			);setq
		);end условия
		
		; вверх															 
		((and (<= angl 135) (>= angl 45));and
			(setq pnt-lin2 (list xpnt-ins (+ ypnt-ins 5))
						align-72 1
						align-73 1     
			);setq
		);end условия  	
			
		; вправо	
		(progn													
			(setq pnt-lin2 (list (+ xpnt-ins 5) ypnt-ins)
						align-72 0
						align-73 2  
		);setq
		);progn
	);cond

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
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				 (cons 72 align-72) ; гориз выравнивание текста
				 (cons 73 align-73) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			) ; end of list
		); entmakex
	);setq
	
	(setvar "osmode" 6199)
);while

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////

