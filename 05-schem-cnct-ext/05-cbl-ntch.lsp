;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование засечки 45 град, толщина 0,6мм                     //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////

(defun c:05-cbl-ntch 

( / pnt-ins weight-line-old xpnt-ins ypnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(while (/= (setq pnt-ins (getpoint "\n”кажите точку вставки\n")) nil)
   (setq xpnt-ins (nth 0 pnt-ins)
				 ypnt-ins (nth 1 pnt-ins)
   ); конец setq
   (setvar "osmode" 0)
   (setq weight-line-old (getvar "celweight"))
   (setvar "celweight" 60)
   (command "_line" (list (+ xpnt-ins 0.707) (+ ypnt-ins 0.707)) (list (- xpnt-ins 0.707) (- ypnt-ins 0.707)) "")
   (setvar "celweight" weight-line-old)
   (setvar "osmode" 6199)
);while
	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;; //////////////////////////// конец программы;; /////////////////////////////