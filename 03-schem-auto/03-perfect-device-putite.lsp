;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-perfect-device-putite

( / adoc angl angl-blck line-1 line-2 line-3 pnt-drct pnt-obj)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)
(setvar "auprec" 7)

(if	(= (tblsearch "block" "оу-давления-путитэ-са") nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (setvar "CELWEIGHT" -1)
		
		(setq	line-1
			(entmakex
				(list
					(cons 0 "LINE")
					(cons 100  "AcDbEntity")
					(cons 100  "AcDbLine")
					(cons 8 "wspom")
					(cons 10 '(0 0))
					(cons 11 '(0 1))
				);list
			);entmake
		);setq
		
		(setvar "CELWEIGHT" 60)
		
		(setq	line-2
			(entmakex
				(list
					(cons 0 "LINE")
					(cons 100  "AcDbEntity")
					(cons 100  "AcDbLine")
					(cons 8 "0")
					(cons 10 '(-1.5 1))
					(cons 11 '(1.5 1))
				);list
			);entmake
		);setq
		
		(setq	line-3
			(entmakex
				(list
					(cons 0 "LINE")
					(cons 100  "AcDbEntity")
					(cons 100  "AcDbLine")
					(cons 8 "0")
					(cons 10 '(0 1))
					(cons 11 '(0 4))
				);list
			);entmake
		);setq
		
		(setvar "CELWEIGHT" -1)
		
		(command "_block" "оу-давления-путитэ-са" '(0 0) line-1 line-2 line-3 "");command
  );progn
);if

(setvar "OSMODE" 6199)

(setq	pnt-obj (getpoint "\nУкажите точку\n")
      pnt-drct (getpoint "\nУкажите направление\n")
			angl (atoi (angtos (angle pnt-obj pnt-drct))) ; угол вставки
);setq

; опеределяем угол поворота и точки вставки
(cond
  ((and (<= angl 315) (>= angl 225));вниз
    (setq angl-blck 180);setq
  );=
  
  ((and (< angl 225) (> angl 135));влево
    (setq angl-blck 90);setq
	);=
	
  ((and (<= angl 135) (>= angl 45));вверх
    (setq angl-blck 0);setq
	);=
	  													
  ((or (< angl 45) (> angl 315));вправо
    (setq angl-blck 270);setq
	);=
);cond

(setvar "OSMODE" 0)

(command "_insert" "оу-давления-путитэ-са" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-obj)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////////
