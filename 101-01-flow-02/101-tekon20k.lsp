;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// Комплекс учета энергоносителей Тэкон-20К                     //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-tekon20k

( / adoc pnt-ins x-pnt-ins y-pnt-ins ypnt-ins-1)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
) ; start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  x-pnt-ins (nth 0 pnt-ins)
	  y-pnt-ins (nth 1 pnt-ins)
	  ypnt-ins-1 y-pnt-ins
); setq

(101-empt-lin-spcf)

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(repeat 10
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins ypnt-ins-1))
  (setq ypnt-ins-1 (- ypnt-ins-1 8)
  );setq
);repeat

(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Комплекс учета энергоносителей в составе:");наименование
(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 44)) 2.5 0 "- Преобразователь расчетно-измерительный")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 "Тэкон-20К")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 44)) 2.5 0 "Тэкон-19, исполнение ****")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins 4)) 2.5 0 "***")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 44)) 2.5 0 "шт.");количество

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "ООО \"ИВП \"КРЕЙТ\",");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 12)) 2.5 0 "г. Екатеринбург")

(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 44)) 2.5 0 "ООО \"ИВП \"КРЕЙТ\",")
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 52)) 2.5 0 "г. Екатеринбург")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "№35615-10");сертификат комплекса
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "в Госреестре СИ,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "свидетельство")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "RU.C.32.005.A №40768")

(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 44)) 2.5 0 "№ 24849-10");сертификат комплекса
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 52)) 2.5 0 "в Госреестре СИ,")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 60)) 2.5 0 "свидетельство")
(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 68)) 2.5 0 "RU.C.32.005.A №40764")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////