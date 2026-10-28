;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// печать в pdf                                                 //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:02-print-to-pdf-01-all

( / counter counter1 crnt-block crnt-pnt file-open format len-list-formats len-of-set list-formats list-pnt name-block-for-del 
name-crnt-block num-1 num-2 path-file-open pnt-1 pnt-2 pnt-crnt-block set-blocks str-f swtch x-crnt-pnt x-pnt-crnt-block y-crnt-pnt 
y-pnt-crnt-block)
 
(setvar "osmode" 0)
(setvar "cmdecho" 1)

;формируем список форматов
(setq path-file-open (findfile "02-print-to-pdf-01-list-formats.txt")
      file-open (open path-file-open "r")
      list-formats (list "")
      str-f 1
);setq

(while (/= str-f nil)
  (setq str-f (read-line file-open));читаем строку
  
  (if (/= str-f nil) (setq list-formats (vl-list* str-f list-formats)));if
);while

(setq list-formats (vl-remove "" list-formats)
      len-list-formats (length list-formats)
);setq

(close file-open)
;///////

;формируем нобор и оставляем в нем только объекты форматов
(setq pnt-1 (getpoint "\nУкажите точку")
      pnt-2 (getpoint "\nУкажите точку") 
);setq

(setq	set-blocks (ssget "_C" pnt-1 pnt-2 '((0 . "INSERT")))
      len-of-set (sslength set-blocks)
		  counter 0
);setq

(sssetfirst set-blocks set-blocks)

(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks counter))
        name-block-for-del (ssname set-blocks counter)
        name-crnt-block (cdr (assoc 2 crnt-block))
        counter1 0
        swtch 1
  );setq
   
  (while (< swtch 2)
    (setq format (nth counter1 list-formats));setq
    
    (if (= name-crnt-block format)
      (setq swtch 2);setq
    );if
    
    (setq counter1 (+ counter1 1));setq

    (if (> counter1 len-list-formats)
      (setq swtch 3);setq
    );if
  );while
  
  (if (= swtch 3)
    (setq set-blocks (ssdel name-block-for-del set-blocks)
           counter (- counter 1)
     );setq
  );if

  (setq counter (+ counter 1));setq
);repeat

;создаем списки по икс и игрек
(setq	len-of-set (sslength set-blocks)
		  counter 0
		  list-pnt (list "")	  
);setq

(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks counter))
        name-crnt-block (cdr (assoc 2 crnt-block))
        pnt-crnt-block (cdr (assoc 10 crnt-block))
        counter1 0
  );setq
  
  (setq list-pnt (vl-list* pnt-crnt-block list-pnt)
  			counter (+ counter 1)
  );setq
);repeat

(setq list-pnt (vl-remove "" list-pnt));setq

;сортируем по возрастанию х
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)));lambda
                                 );fun
               );vl-sort
);setq

(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)));lambda
                                 );fun
               );vl-sort
);setq

;сортируем по убыванию y
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (> (nth 1 num-1) (nth 1 num-2)));lambda
                                 );fun
               );vl-sort
);setq

(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (> (nth 1 num-1) (nth 1 num-2)));lambda
                                 );fun
               );vl-sort
);setq

;печатаем
(setq	counter1 0);setq

(repeat (length list-pnt)
  (setq crnt-pnt (nth counter1 list-pnt)
        x-crnt-pnt (nth 0 crnt-pnt)
        y-crnt-pnt (nth 1 crnt-pnt)
        pnt-crnt-block 0
        counter 0
  );setq

	(repeat len-of-set
		(setq	crnt-block (entget (ssname set-blocks counter))
					name-crnt-block (cdr (assoc 2 crnt-block))
					pnt-crnt-block (cdr (assoc 10 crnt-block))
					x-pnt-crnt-block (nth 0 pnt-crnt-block)
					y-pnt-crnt-block (nth 1 pnt-crnt-block)     
		);setq
							
		(if (and (= x-crnt-pnt x-pnt-crnt-block) (= y-crnt-pnt y-pnt-crnt-block)) 
			(print-to-pdf-11 name-crnt-block x-pnt-crnt-block y-pnt-crnt-block)
		);if
		
		(setvar "osmode" 0)
		  
		(setq counter (+ counter 1));setq
		);repeat
		
		(setq counter1 (+ counter1 1));setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;////////////////////////////////////////// конец программы ///////////////////////////////////

;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// подготавливаем данные для печати                             //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun print-to-pdf-11

(arg-01 arg-02 arg-03 / format-page model-printer page-orientation pnt-lft-bottom pnt-rght-top)

(setvar "cmdecho" 0)

(setvar "osmode" 0)

(setq page-orientation nil
      pnt-lft-bottom nil
      pnt-rght-top nil
      model-printer "PDF reDirect v2" ;model-printer "PDF reDirect v2"
);setq

;параметры печати а4 вертикально
(if (or (= arg-01 "а4-спдс-лист-1-верт")
				(= arg-01 "а4-спдс-лист-2-верт")
				(= arg-01 "а4-спдс-обложка-1-лист-1-верт")
				(= arg-01 "а4-спдс-обложка-1-лист-2-верт")
				(= arg-01 "а4-ескд-лист-1-верт")
				(= arg-01 "а4-ескд-лист-2-верт")
				(= arg-01 "а4-спдс-лист-1-верт-разр-внесен-изм")
				(= arg-01 "а4-спдс-лист-2-верт-разр-внесен-изм")
		);or

  (setq format-page "A4"
        page-orientation "_p"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 250) (+ arg-03 297));правая верхняя точка печати
  );setq
);if

;параметры печати а4х3 горизонтально
(if (or (= arg-01 "a4х3-спдс-лист-1-гориз")
				(= arg-01 "a4х3-спдс-лист-2-гориз")
		);or
  
  (setq model-printer "PDF reDirect v2 a4x3.pc3"
  			format-page "Особый размер страницы PostScript"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 670) (+ arg-03 297));правая верхняя точка печати
  );setq
);if


;параметры печати а3 горизонтально
(if (or (= arg-01 "а3-спдс-лист-1-гориз")
				(= arg-01 "а3-спдс-лист-2-гориз")
		);or
		
  (setq format-page "A3"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 460) (+ arg-03 297));правая верхняя точка печати
  );setq
);if


;параметры печати а2 горизонтально
(if (or (= arg-01 "а2-спдс-лист-1-гориз")
				(= arg-01 "а2-спдс-лист-2-гориз")
		);or
		
  (setq format-page "A2"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 634) (+ arg-03 415));правая верхняя точка печати
  );setq
);if

		  				  
;параметры печати а1 горизонтально
(if (or (= arg-01 "a1-спдс-лист-1-гориз")
				(= arg-01 "a1-спдс-лист-2-гориз")
		);or
		
  (setq format-page "A1"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 881) (+ arg-03 589));правая верхняя точка печати
  );setq
);if

;параметры печати а1х3 горизонтально
(if (or (= arg-01 "a1х3-спдс-лист-1-гориз")
				(= arg-01 "a1х3-спдс-лист-2-гориз")
		);or
		
  (setq ;model-printer "PDF reDirect v2 a1x3.pc3"
  			format-page "Особый размер страницы PostScript"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 1823) (+ arg-03 836));правая верхняя точка печати
  );setq
);if

;параметры печати а0 вертикально
(if (or (= arg-01 "а0-спдс-лист-1-верт")
				(= arg-01 "а0-спдс-лист-2-верт")
		);or
		
  (setq format-page "A0"
        page-orientation "_p"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 881) (+ arg-03 1185));правая верхняя точка печати
  );setq
);if

;параметры печати а0 горизонтально
(if (or (= arg-01 "а0-спдс-лист-1-гориз")
				(= arg-01 "а0-спдс-лист-2-гориз")
		);or
		
  (setq format-page "A0"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 1229) (+ arg-03 836));правая верхняя точка печати
  );setq
);if

;параметры печати а0х2 горизонтально
(if (= arg-01 "а0х2-спдс-лист-1-гориз")

  (setq format-page "Особый размер страницы PostScript"
        page-orientation "_l"
        pnt-lft-bottom (list (+ arg-02 40) arg-03);левая нижняя точка печати
        pnt-rght-top (list (+ arg-02 1722) (+ arg-03 1184));правая верхняя точка печати
  );setq
);if

(command "_plot"
  "_y" ; Выполнить детальное задание конфигурации? [Да/Нет] <Нет>: _y
  "Model"	;Имя листа или [?] <Модель>: Модель
  model-printer	;Имя устройства вывода или [?]
  format-page	;Формат листа бумаги или [?] <A4>: A4
  "m"	;Единицы измерения размеров листа [Дюймы/Миллиметры] <Миллиметры>: _m
  page-orientation	;Ориентация чертежа [Книжная/Альбомная] <Книжная>: _p	
  "_n"	;Перевернуть чертеж? [Да/Нет] <Нет>: _n
  "_w"	;Печатаемая область [Экран/Границы/Лимиты/Вид/Рамка] <Рамка>: _w
  pnt-lft-bottom;Левый нижний угол рамки
  pnt-rght-top	;Правый верхний угол рамки
  "_f"	;Масштаб печати (Миллиметры чертежа=Единицы рисунка) или [Вписать] <Вписать>: _f
  "_c"	;Смещение от начала (x,y) или [Центрировать] <Центрировать>: _c
  "_y"	;Учитывать стили печати? [Да/Нет] <Нет>: _n
  "monochrome.ctb"	;Имя таблицы стилей печати или [?] (. если нет) <>: .
  "_y"	;Учитывать веса линий? [Да/Нет] :Plot with lineweights? [Yes/No]
  "As displayed"	;Режим вывода раскрашенных ВЭ [Обычный/Каркас/Скрытие линий/Тонирование] 
						      ;Enter shade plot setting [As displayed/Wireframe/Hidden/Visual styles/Rendered] <As displayed>
  "_n"	;Запись чертежа в файл [Да/Нет] <Н>: _n               
  "_y"	;Сохранить изменения параметров листа [Да/Нет]? <Н> _n
  "_y"	;Перейти к печати [Да/Нет] <Д>: _y
);plot

(strcat (vl-filename-base (getvar "DWGNAME")) format-page ".pdf")  
 
(setvar "cmdecho" 0)
)
;/////// конец программы ///////