;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// УГО клапан редукционный гост 21.205                          ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:699-gost-21-205-filter

( / adoc lin-1 lin-2 polygon-1)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
	(command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if


(if	(= (tblsearch "block" "фильтр-гост-21-205-схтх") nil);создаем блок
  (progn

	  ; вертикальная линия
  	(setvar "celtscale" 0.2) ;масштаб линии
  
  	(setq lin-1 (entmakex (list '(0 . "LINE") '(100 . "AcDbEntity") '(100 . "AcDbLine") '(10  0. 5.) '(11  0. -5.) '(6 . "acad_iso02w100")));entmakex
  	);setq 

  	(setvar "celtscale" 1)
	
		(command "_polygon" 4 '(0 0) "_i" '(0 5)) ;прямоугольник
		(setq polygon-1 (entlast))
	
		(command "_block" "фильтр-гост-21-205-схтх" '(0 -5) lin-1 polygon-1"");command
  );progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq pnt-drctn (getpoint "\nУкажите точку направления\n")
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
	);setq

	(cond
		((and (< angl 135) (> angl 45)) ;вверх
			(setq angl-blck 90);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 180);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 270);setq
		);=
		
		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 0);setq
		);=
	);cond
	
	(setvar "osmode" 0)
	
	(command "_insert" "фильтр-гост-21-205-схтх" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
	
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
