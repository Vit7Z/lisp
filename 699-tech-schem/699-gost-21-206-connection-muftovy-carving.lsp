
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Соединение муфтовое резьбовое ГОСТ 21.206-93, ГОСТ 2.784-96  //////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-206-connection-muftovy-carving

( / adoc angl angl-blck angl-lin-1 angl-lin-2 block-1 lin-1 lin-2 pnt-drctn pnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
) ; start undo
(setvar "cmdecho" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "соединение-муфтовое-резьбовое-гост-21-206-схтх") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_line" '(0 1) '(0 -1) "")
    (setq lin-1 (entlast))
    (command "_line" '(1 1.5) '(1 -1.5) "")
    (setq lin-2 (entlast))
    (command "_line" '(1 1.5) '(0 1.5) "")
    (setq lin-3 (entlast))
    (command "_line" '(1 -1.5) '(0 -1.5) "")
    (setq lin-4 (entlast))
		(command "_block" "соединение-муфтовое-резьбовое-гост-21-206-схтх" '(0 0) lin-1 lin-2 lin-3 lin-4 "");command
  ) ; конец progn
);if	

(setvar "osmode" 6199)
(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn	 (getpoint "\nУкажите точку направления\n")
	  		angl (atoi (angtos (angle pnt-ins pnt-drctn) 1))
  );setq

	(cond
		((and (< angl 135) (> angl 45)) ;вверх
			(setq angl-blck 90
						angl-lin-1 "135" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "45"
			);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 180
						angl-lin-1 "135" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "225"
			);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 270
						angl-lin-1 "225" ;углы для точек секущей линни для обрезаний линий
						angl-lin-2 "315"
			);setq
		);=

		
		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 0
						angl-lin-1 "45"
						angl-lin-2 "315"
			);setq
		);=
	);cond

  (setvar "osmode" 0)
  
  (command "_insert" "соединение-муфтовое-резьбовое-гост-21-206-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
 	(setq block-1 (entlast));setq
 	
	(command "_trim" block-1 "" 
		(polar pnt-ins (angtof angl-lin-1 0) 0.5) ;точка 1, обрезка линии внутри блока
		(polar pnt-ins (angtof angl-lin-2 0) 0.6) ;точка 2
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