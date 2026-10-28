;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// УГО насос                                                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-2-782-pump-not-reg-not-revers

( / adoc angl angl-blck angl-lin-1 angl-lin-2 block-1 circle-1 hatch-1 lin-1 lin-2 lin-3 pnt-1 pnt-2 pnt-drctn pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if	(= (tblsearch "block" "насос-гост-2-782-пост-напр-схтх") nil);создаем блок
  (progn
	 	(command "_circle" '(0 5) 5 "")
		(setq circle-1 (entlast))

		(setq pnt-1 (polar '(0 10) (angtof "240" 0) 4));setq
		(setq pnt-2 (polar pnt-1 (angtof "0" 0) 4));setq

		(command "_line" '(0 10) pnt-1 "")
		(setq lin-1 (entlast))

		(command "_line" pnt-1 pnt-2 "")
		(setq lin-2 (entlast))

		(command "_line" pnt-2 '(0 10) "")
		(setq lin-3 (entlast))


		(command "_hatch" "solid" lin-1 lin-2 lin-3 "")
		(setq hatch-1 (entlast))
		
		(command "_block" "насос-гост-2-782-пост-напр-схтх" '(0 0) circle-1 lin-1 lin-2 lin-3 hatch-1 "");command
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
			(setq angl-blck 0
						angl-lin-1 "135" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "45"
			);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 90
						angl-lin-1 "135" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "225"
			);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 180
						angl-lin-1 "225" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "315"
			);setq
		);=
		
		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 270
						angl-lin-1 "45"
						angl-lin-2 "315"
			);setq
		);=
	);cond
	
	(command "_insert" "насос-гост-2-782-пост-напр-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
			
	(setq block-1 (entlast));setq
			
	(command "_trim" block-1 "" 
		(polar pnt-ins (angtof angl-lin-1 0) 5) ;точка 1, обрезка линии внутри блока
		(polar pnt-ins (angtof angl-lin-2 0) 6) ;точка 2
	"")

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
