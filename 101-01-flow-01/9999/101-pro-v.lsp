;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                                   /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:101-pro-v

( / adoc delta-y pnt-ins x-pnt-ins y-pnt-ins ypnt-ins-1)

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
	  ypnt-ins-1 y-pnt-ins
	  delta-y 8
); setq

(101-empt-lin-spcf)

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(repeat 11
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 delta-y)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Расходомер вихревой");наименование
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 "- многопараметричность (что измеряем) ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 "- длина штанги, мм. ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 28)) 2.5 0 "- электронный блок ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 36)) 2.5 0 "- дисплей ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 44)) 2.5 0 "- питание")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 52)) 2.5 0 "- выходные сигналы ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 60)) 2.5 0 "- температура измеряемой среды ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 68)) 2.5 0 "- давление среды ***")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 76)) 2.5 0 "- уплотнения и присоединения к процессу ***")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "Pro-V модель M23")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "Vortek Instruments");производитель

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "№ 35299-07");сертификат
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "в Госреестре СИ,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "сертификат")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "RU.C.29.006.A №24176")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////