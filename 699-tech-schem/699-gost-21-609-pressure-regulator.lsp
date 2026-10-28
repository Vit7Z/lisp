;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// регулятор давления ГОСТ 21.609                               //////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-609-pressure-regulator

( / adoc angl angl-blck lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 pnt-drctn pnt-ins x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
) ; start undo
(setvar "cmdecho" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "регулятор-давления-гост-21-609-схтх") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_line" '(0 1.5) '(0 -1.5) "")
    (setq lin-1 (entlast))
    
    (command "_line" '(6 1.5) '(6 -1.5) "")
    (setq lin-2 (entlast))
    
    (command "_line" '(0 1.5) '(6 -1.5) "")
    (setq lin-3 (entlast))
    
    (command "_line" '(0 -1.5) '(6 1.5) "")
    (setq lin-4 (entlast))     


    (command "_line" '(3 1) '(3 -2) "")
    (setq lin-5 (entlast))

    (command "_line" '(1.5 -2) '(4.5 -2) "")
    (setq lin-6 (entlast)) 

    (command "_line" '(1.5 -3) '(4.5 -3) "")
    (setq lin-7 (entlast))
    
		(command "_block" "регулятор-давления-гост-21-609-схтх" '(0 0) lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 "");command
  ) ; конец progn
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
	(command "_insert" "регулятор-давления-гост-21-609-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

