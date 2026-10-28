;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование конца трубы                                        //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:699-pipeend

( / adoc angl-1 angl-1-int angl-2-int arc-1 arc-2 arc-3 dist dist-1 dist-1-abs dist-div-2 dist-div-4 pi pnt-1 pnt-2 pnt-3 pnt-arc1-e 
pnt-arc1-m pnt-arc2-m pnt-arc3-m pnt-mdl ss1 width-half xpnt-1 xpnt-2 ypnt-1 ypnt-2)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq	pnt-1 (getpoint "\n”кажите 1 точку (закрашено)\n")
	    pnt-2 (getpoint "\n”кажите 2 точку\n")
);setq

(setvar "osmode" 0)

;исходные данные
(setq	pnt-3 (getpoint "\n”кажите точку направлени€\n")
	    
		  xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)
			xpnt-2 (nth 0 pnt-2)
			ypnt-2 (nth 1 pnt-2)

			pnt-mdl (list (* (+ xpnt-1 xpnt-2) 0.5) (* (+ ypnt-1 ypnt-2) 0.5))
			
			pi 3.1415926535

  		angl-1 (angle pnt-1 pnt-2)
  		angl-1-int (atoi (angtos (angle pnt-1 pnt-2)))
  		angl-2-int (atoi (angtos (angle pnt-mdl pnt-3)))
  		
  		;вычисл€ем рассто€ни€
      dist-1 (distance pnt-2 pnt-1)
      dist-1-abs (abs dist-1)
      dist-div-2 (/ dist-1-abs 2)
      dist-div-4 (/ dist-1-abs 4)
      
      width-half 0.8
  		
  		ss1 (ssadd) ;пустой набор, куда будут собиратьс€ нарисованные примитивы
);setq

(if (and (>= dist-1-abs 8) (<= dist 24))
  (setq width-half 1.5);setq
);if

(if (> dist-1-abs 24)
  (setq width-half 2);setq
);if
  
(setq pnt-arc1-m (polar pnt-1 (+ angl-1 (/ pi 9)) dist-div-4)
      
      pnt-arc1-e (polar pnt-1 angl-1 dist-div-2)
      pnt-arc2-m (polar pnt-1 (- angl-1 (/ pi 9)) dist-div-4);дуга прав, верхн
      pnt-arc3-m (polar pnt-arc1-e (+ angl-1 (/ pi 9)) dist-div-4);дуга прав, нижн
);setq

(command "_.arc" pnt-1 pnt-arc1-m pnt-arc1-e)
(setq arc-1 (entlast))

(command "_.arc" pnt-1 pnt-arc2-m pnt-arc1-e)
(setq arc-2 (entlast))

(command "_hatch" "solid" arc-1 arc-2 "")

(setq ss1 (ssadd arc-2 ss1));setq

(command "_.arc" pnt-arc1-e pnt-arc3-m pnt-2)

(setq arc-3 (entlast))

(setq ss1 (ssadd arc-3 ss1));setq

;;;;;;;объединение отрезков в одну полилинию
(setvar 'PEDITACCEPT 1)
(command "_pedit" "_M" ss1 "" "_J" "" "")
(setvar 'PEDITACCEPT 0)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
