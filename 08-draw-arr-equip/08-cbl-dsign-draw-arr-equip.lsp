;/////////////////////////////// кабели из свп (обозначение) в кабель на чро //////////////////////////////////////////
(defun c:08-cbl-dsign-draw-arr-equip

( / box-txt counter dlt-x-rctgl dlt-x-txt drctn length-of-set len-txt pnt-1 pnt-ins set-txt txt xpnt-1 xpnt-ins ypnt-1 ypnt-ins ypnt-ins-basic)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
);if

(setq set-txt (ssget '((0 . "TEXT")))
			length-of-set (sslength set-txt)
			counter 0
			dlt-x-rctgl 0
			len-txt 0
);setq

(repeat length-of-set 
	(setq txt (entget (ssname set-txt counter))
	      txt (list (assoc 1 txt))
	      box-txt (textbox txt)
	      len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)));длина текста
	);setq
	  
	(if (> len-txt dlt-x-rctgl) (setq dlt-x-rctgl len-txt));if
 
 	(setq counter (1+ counter));setq
);repeat

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			ypnt-ins-basic ypnt-ins;базовый уровень
			pnt-1 (getpoint "\nУкажите точку направления\n")
			xpnt-1 (nth 0 pnt-1)
			ypnt-1 (nth 1 pnt-1)
			counter 0		
);setq

(setq dlt-x-rctgl (+ (fix dlt-x-rctgl) 3)
			drctn (- xpnt-ins xpnt-1)
);setq

(if	(> drctn 0) (setq dlt-x-rctgl (- 0 dlt-x-rctgl)));if

(setq dlt-x-txt (* dlt-x-rctgl 0.5));setq

(setvar "OSMODE" 0)

(repeat length-of-set 
	(progn
	  (setq txt (entget (ssname set-txt counter))
	        txt (cdr (assoc 1 txt))
	  );setq
	  
    (command "_RECTANGLE" pnt-ins (list (+ xpnt-ins dlt-x-rctgl) (- ypnt-ins 4)))
    (command "_TEXT" "_MC" (list (+ xpnt-ins dlt-x-txt) (- ypnt-ins 2)) 2.5 0 txt)
    
    (setq ypnt-ins (- ypnt-ins 4)
					pnt-ins (list xpnt-ins ypnt-ins)
					counter (1+ counter)
    );setq
	);progn
);repeat

(command "_layer" "Установить" "0" "")

(setvar "ORTHOMODE" 1)
(setvar "OSMODE" 6199)
(setvar "cmdecho" 1)
(princ)
)
;////////////////////////////////////////// конец программы ///////////////////////////////////

