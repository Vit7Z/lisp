;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// рисование знака кабеля на ссвп                               ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun c:05-pls-pipe-pulse-sign-w-number

( / adoc pnt-ins pnt-txt xpnt-ins ypnt-ins)
   
(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку оси\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				pnt-txt (list xpnt-ins (- ypnt-ins 3))
	);setq

	(setvar "osmode" 0)
	(command "_.TEXT" "_J" "_MC" pnt-txt 2.5 0 "0***")
	(command "_.CIRCLE" pnt-txt 3)
	(setvar "osmode" 6199)
);while

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////
