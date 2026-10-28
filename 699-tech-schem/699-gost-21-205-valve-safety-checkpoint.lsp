;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Клапан предохранительный проходной ГОСТ 21.205-93, ГОСТ 2.784-96      /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-205-valve-safety-checkpoint

( / adoc angl angl-blck lin-1 lin-10 lin-11 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 lin-8 lin-9 pnt-1 pnt-2 pnt-3 pnt-4 pnt-5 pnt-6 pnt-drctn pnt-ins x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "клапан-предохранительный-проходной-гост-21-205-схтх") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    
    (command "_line" '(-3 1.5) '(3 -1.5) "");тело
    (setq lin-1 (entlast))
    
    (command "_line" '(-3 -1.5) '(3 1.5) "")
    (setq lin-2 (entlast))
    
    (command "_line" '(-3 1.5) '(-3 -1.5) "")
    (setq lin-3 (entlast))
    
    (command "_line" '(3 1.5) '(3 -1.5) "")
    (setq lin-4 (entlast))

		(command "_line" '(0 0) '(0 1.5) "");пружинка
    (setq lin-5 (entlast))

		(setq pnt-1 (polar '(0 1.5) (angtof "15" 0) 1.5));setq
		(command "_line" '(0 1.5) pnt-1 "")
		(setq lin-6 (entlast))
		
		(setq pnt-2 (polar pnt-1 (angtof "165" 0) 3));setq
		(command "_line" pnt-1 pnt-2 "")
		(setq lin-7 (entlast))

		(setq pnt-3 (polar pnt-2 (angtof "15" 0) 3));setq
		(command "_line" pnt-2 pnt-3 "")
		(setq lin-8 (entlast))
		
		(setq pnt-4 (polar pnt-3 (angtof "165" 0) 3));setq
		(command "_line" pnt-3 pnt-4 "")
		(setq lin-9 (entlast))
	
		(setq pnt-5 (polar pnt-4 (angtof "15" 0) 1.5));setq
		(command "_line" pnt-4 pnt-5 "")
		(setq lin-10 (entlast))

		(setq pnt-6 (polar pnt-5 (angtof "90" 0) 1.5));setq
		(command "_line" pnt-5 pnt-6 "")
		(setq lin-11 (entlast))
					
		(command "_block" "клапан-предохранительный-проходной-гост-21-205-схтх" '(-3 0) lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7  lin-8  lin-9  lin-10  lin-11 "");command
  ) ;progn
);if	

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq pnt-drctn (getpoint "\nУкажите точку направления\n")
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
	);setq

	(cond
		((and (< angl 135) (> angl 45)) ;вверх
			(setq angl-blck 90);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 0
						pnt-ins (list (- x-pnt-ins 6) y-pnt-ins)
			);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 90
						pnt-ins (list x-pnt-ins (- y-pnt-ins 6))
			);setq
		);=
		
		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 0);setq
		);=
	);cond
	
	(setvar "osmode" 0)
	(command "_insert" "клапан-предохранительный-проходной-гост-21-205-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
	(setvar "osmode" 6199)
);while


(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
