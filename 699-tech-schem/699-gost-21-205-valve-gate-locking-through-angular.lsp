;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// УГО клапан вентиль запорный угловой                          ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-205-valve-gate-locking-through-angular

( / adoc angl angl-blck lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 name-block pnt-drctn pnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq name-block "клапан-запорный-угловой-гост-21-205-схтх");setq

(if	(= (tblsearch "block" name-block) nil);создаем блок
  (progn

		(command "_line" '(-1.5 0) '(1.5 0) "");вертик кран
		(setq lin-1 (entlast))
		
		(command "_line" '(-1.5 0) '(0 3) "")
		(setq lin-2 (entlast))
		
		(command "_line" '(1.5 0) '(0 3) "")
		(setq lin-3 (entlast))
		
		(command "_line" '(3 4.5) '(0 3) "");треугольник сбоку
		(setq lin-4 (entlast))
		
		(command "_line" '(3 4.5) '(3 1.5) "")
		(setq lin-5 (entlast))
		
		(command "_line" '(3 1.5) '(0 3) "")
		(setq lin-6 (entlast))
				
		(command "_block" name-block '(0 0) lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 "");command
  );progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq pnt-drctn (getpoint "\nУкажите точку направления\n")
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
	);setq

	(setvar "osmode" 0)

	(cond
		((and (< angl 135) (> angl 45)) ;вверх
			(setq angl-blck 0);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 90);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 180);setq
		);=
		
		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 270);setq
		);=
	);cond
	
	(command "_insert" name-block "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
	
	(setvar "osmode" 6199)
);while


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
