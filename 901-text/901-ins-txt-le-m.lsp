; ///////////////////////   вставка текста в пэ в середину ячейки ////////////////////////////////////////
(defun c:901-ins-txt-le-m 

( / pnt-ins xpnt-ins ypnt-ins)

(setvar	"OSMODE" 6199)
(setvar	"cmdecho" 0)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq xpnt-ins (nth 0 pnt-ins)
		    ypnt-ins (nth 1 pnt-ins)
        pnt-ins (list xpnt-ins (+ ypnt-ins 4))
  );setq
  (setvar	"OSMODE" 0)
  (command "_TEXT" "_MC" pnt-ins 2.5 0 "****")
  (setvar	"OSMODE" 6199)
);while

(setvar	"cmdecho" 1)
(setvar	"OSMODE" 6199)

(princ)
)
; /////////////////////// конец программы ///////////////////////////////////////////////////////////////

