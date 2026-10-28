;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// спг                                                          //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-gas-meter-spg

( / adoc file-open path-file-open pnt-ins standard-size str-diam str-f str-left str-mass str-size-1 str-size-2 x-pnt-ins y-pnt-ins)

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

(repeat 10
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 delta-y)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Комплекс измерительный в составе:");наименование
(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 44)) 2.5 0 "- Корректор газа")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "****")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 "ТУ 4217-047-23041473-2005")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 44)) 2.5 0 "СПГ ****")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 52)) 2.5 0 "ТУ 4217-058-23041473-2007")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins 4)) 2.5 0 "1")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 44)) 2.5 0 "шт.");количество
(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins 44)) 2.5 0 "1")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "ЗАО НПФ ЛОГИКА,");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Санкт-Петербург")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 44)) 2.5 0 "ЗАО НПФ ЛОГИКА,");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 52)) 2.5 0 "г. Санкт-Петербург")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "Свидетельство");сертификат комплекса
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "RU.C.32.004.A №21405,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "№ 29665-05")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "в Госреестре СИ")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 44)) 2.5 0 "Свидетельство");сертификат корректор
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 52)) 2.5 0 "RU.C.29.004.A №31455,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 60)) 2.5 0 "№37670-08")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 68)) 2.5 0 "в Госреестре СИ")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////