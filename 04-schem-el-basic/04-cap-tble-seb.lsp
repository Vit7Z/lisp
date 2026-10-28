;///////// рисование подвала (таблицы) дл€ схемы электропитани€ по трем точкам крайн€€ лева€, нижн€€, ркрайн€€ права€
(defun c:04-cap-tble-seb

( / adoc crnt-color pnt-1-rctgl pnt-2-rctgl pnt-ins-1 pnt-ins-2 pnt-ins-3 pnt-txt txt-2 x-dlt x-dlt-mtxt x-lft x-mdl-txt x-rght y-top)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
	
(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq crnt-color (getvar "cecolor")

			pnt-ins-1 (getpoint "\n”кажите крайнюю левую точку\n")
			
			pnt-ins-2 (getpoint "\n”кажите крайнюю нижнюю точку\n")
			
			pnt-ins-3 (getpoint "\n”кажите крайнюю правую точку\n")			
			
			x-dlt (getint "\n”кажите рассто€ние\n")
			
			x-lft (nth 0 pnt-ins-1) ;крайн€€ лева€ координата дл€ пр€моугольника
			
			x-rght (nth 0 pnt-ins-3)	;крайн€€ права€ координата дл€ пр€моугольника
				
			y-top (nth 1 pnt-ins-2)
);setq

(if (= x-dlt nil)
	(setq x-dlt 0)
);if

(setq x-lft (- x-lft x-dlt)

			x-rght (+ x-rght x-dlt)
			
			x-mdl-txt (+ x-lft (* (- x-rght x-lft) 0.5)) ;координата середины однострочноготекста
			
			x-dlt-mtxt (- (- x-rght x-lft) 1) ;половина ширины дл€ многострочноготекста
);setq

(setvar "osmode" 0)

(setvar "textsize" 2.5)

(setvar "celtype" "ByLayer")

;определ€ем точки пр€моуголника 1
(setq pnt-1-rctgl	(list x-lft y-top)
			pnt-2-rctgl	(list x-rght (- y-top 8))
			
			pnt-txt (list x-mdl-txt (- y-top 4))
);setq

;рисуем пр€моугольник 1
(command "_rectangle" pnt-1-rctgl pnt-2-rctgl)

(command "_text" "_mc" pnt-txt 2.5 0 "***1")

;определ€ем точки пр€моуголника 2
(setq pnt-1-rctgl	(list x-lft (- y-top 8))
			pnt-2-rctgl	(list x-rght (- y-top 42))
			
			pnt-txt (list x-mdl-txt (- y-top 25))
);setq

;рисуем пр€моугольник 2
(command "_rectangle" pnt-1-rctgl pnt-2-rctgl)

(setq txt-2
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
      (cons 10 pnt-txt) 
      '(1 . "***2") 
      '(8 . "0")
      '(40 . 2.5) 
      (cons 41 x-dlt-mtxt) 
      (cons 42 x-dlt-mtxt) 
      '(71 . 5) 
      '(370 . -1) 
       (cons 7 (getvar "textstyle")) 
    );list
  );entmakex
);setq

;определ€ем точки пр€моуголника 3
(setq pnt-1-rctgl	(list x-lft (- y-top 42))
			pnt-2-rctgl	(list x-rght (- y-top 50))
			
			pnt-txt (list x-mdl-txt (- y-top 46))
);setq

;рисуем пр€моугольник 3
(command "_rectangle" pnt-1-rctgl pnt-2-rctgl)

(command "_text" "_mc" pnt-txt 2.5 0 "***¬")

;определ€ем точки пр€моуголника 4
(setq pnt-1-rctgl	(list x-lft (- y-top 50))
			pnt-2-rctgl	(list x-rght (- y-top 58))
			
			pnt-txt (list x-mdl-txt (- y-top 54))
);setq

;рисуем пр€моугольник 4
(command "_rectangle" pnt-1-rctgl pnt-2-rctgl)

(command "_text" "_mc" pnt-txt 2.5 0 "***4")

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////
