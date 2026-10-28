;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// УГО Затвор поворотный                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-205-lock-rotary

( / adoc angl angl-blck circle-1 hatch-1 lin-1 pnt-1 pnt-2 pnt-drctn pnt-ins rectangle-1)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if	(= (tblsearch "block" "затвор-поворотный-гост-21-205-схтх") nil);создаем блок
  (progn
	 	(command "_circle" '(0 4) 0.5 "")
		(setq circle-1 (entlast))

		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))


		(setq pnt-1 (polar '(0 4) (angtof "45" 0) 1.5));setq
		(setq pnt-2 (polar '(0 4) (angtof "225" 0) 1.5));setq

		(setvar "celweight" 60)

		(command "_line" pnt-1 pnt-2 "")
		(setq lin-1 (entlast))

		(setvar "celweight" -1)

		(command "_rectangle" '(-2 0) '(2 8)) ;прямоугольник
		(setq rectangle-1 (entlast))
		
		(command "_block" "затвор-поворотный-гост-21-205-схтх" '(0 0) circle-1 hatch-1 lin-1 rectangle-1"");command
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
	
	(command "_insert" "затвор-поворотный-гост-21-205-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
	
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
