;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                                   /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-01-flwmtr-vzljot-er

( / adoc pnt-ins x-pnt-ins y-pnt-ins y-pnt-ins-1)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
) ; start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  x-pnt-ins (nth 0 pnt-ins)
	  y-pnt-ins (nth 1 pnt-ins)
	  y-pnt-ins-1 y-pnt-ins
); setq

(101-empt-lin-spcf)

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(repeat 5
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  (setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Расходомер-счетчик электромагнитный");наименование

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "ВЗЛЕТ ЭР") 
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 "*******")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 20)) 2.5 0 "*******.ОЛ**") 

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins 4)) 2.5 0 "***")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "ЗАО \"Взлет\",");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Санкт-Петербург")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "Свидетельство");сертификат
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "RU.C.29.006.A №40673,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "№ 20293-10")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "в Госреестре СИ")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////



       
