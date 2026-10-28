;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// конец проводки сэп                                           //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:04-conducting-end

( / adoc pnt-ins xpnt ypnt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq xpnt (nth 0 pnt-ins)
        ypnt (nth 1 pnt-ins)
  );setq
  (setvar "CELWEIGHT" 60)
  (setvar "osmode" 0)
  (command "_line" (list xpnt (+ ypnt 1)) (list xpnt (- ypnt 1)) "")
  (setvar "CELWEIGHT" -1)
  (setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

