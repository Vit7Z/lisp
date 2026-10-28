;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование линии разрыва одинарн                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:10-rupture-line-s1

( / adoc angl_lin chng-lin pi pnt-1 pnt-11 pnt-2 pnt-3 pnt-4 pnt-5 pnt-6 pnt-tmp ss1)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "auprec" 7)

(setq chng-lin (entsel "\nВыберите линию")
      pnt-1 (cdr (assoc 10 (entget (car chng-lin))))
      pnt-2 (cdr (assoc 11 (entget (car chng-lin))))
      
      pnt-11 (getpoint "\nУкажите точку 1\n")
      
      pi 3.1415926535
      
      angl_lin (angle pnt-1 pnt-2)
      
      ss1 (ssadd)
);setq

(setvar "osmode" 0)

(setq pnt-1 (polar pnt-11 (+ angl_lin (* pi 0.5)) 3.5)
      
      pnt-2 (polar pnt-11 (+ angl_lin (* pi 0.5)) 1.5)
      
      pnt-tmp (polar pnt-11 (+ angl_lin (* pi 0.5)) 0.75)
      
      pnt-3 (polar pnt-tmp (+ angl_lin pi) 1.5)
      
      pnt-tmp (polar pnt-11 (+ angl_lin (* pi 1.5)) 0.75)
      
      pnt-4 (polar pnt-tmp angl_lin 1.5)

      pnt-5 (polar pnt-11 (+ angl_lin (* pi 1.5)) 1.5)
      
      pnt-6 (polar pnt-11 (+ angl_lin (* pi 1.5)) 3.5)
);setq

(command "_.line" pnt-1 pnt-2 "")
(setq ss1 (ssadd (entlast) ss1));setq

(command "_.line" pnt-2 pnt-3 "")
(setq ss1 (ssadd (entlast) ss1));setq

(command "_.line" pnt-3 pnt-4 "")
(setq ss1 (ssadd (entlast) ss1));setq

(command "_.line" pnt-4 pnt-5 "")
(setq ss1 (ssadd (entlast) ss1));setq

(command "_.line" pnt-5 pnt-6 "")
(setq ss1 (ssadd (entlast) ss1));setq

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