;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                                   /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-04-pwr-unt-elemer

( / adoc dcl-id file-open list-001 list-002 list-003 list-004 list-005 list-101 list-spcf path-file-open str-f str-lft-1 str-lft-2 str-lft-3 str-lft-4 str-lft-5 type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-f 1;переменные
      list-001 (list "")
      list-002 (list "")
      list-003 (list "")
      list-004 (list "")
      list-005 (list "")
      str-lft-1 ""
      str-lft-2 ""
      str-lft-3 ""
      str-lft-4 ""
      str-lft-5 ""
);setq

(setq path-file-open (findfile "101-04-pwr-unt-elemer.txt");открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(while (/= str-f nil)
  (setq str-f (read-line file-open);читаем строку
  );setq
  (if (/= str-f nil)
    (setq str-lft-1 (substr str-f 1 (vl-string-search "\\" str-f))
    
          str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
          str-lft-2 (substr str-f 1 (vl-string-search "\\" str-f))
          
          str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
          str-lft-3 (substr str-f 1 (vl-string-search "\\" str-f))
          
          str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
          str-lft-4 (substr str-f 1 (vl-string-search "\\" str-f))
          
          str-lft-5 (substr str-f (+ (vl-string-search "\\" str-f) 2))
            
          list-001 (vl-list* str-lft-1 list-001);создаем список из считанных строк из файла
          list-002 (vl-list* str-lft-2 list-002)
          list-003 (vl-list* str-lft-3 list-003)
          list-004 (vl-list* str-lft-4 list-004)
          list-005 (vl-list* str-lft-5 list-005)
    );setq
  );if
);while

(close file-open)

(setq list-001 (reverse (vl-remove "" list-001))
      list-002 (reverse (vl-remove "" list-002))
      list-003 (reverse (vl-remove "" list-003))
      list-004 (reverse (vl-remove "" list-004))
      list-005 (reverse (vl-remove "" list-005))
);setq

(if (< (setq dcl-id (load_dialog "dia-101-04-pwr-unt-elemer.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_pwr_unt_elemer" dcl-id))
		(exit)
);if

(list-filling "txt-001" list-001)
(list-filling "txt-002" list-002)
(list-filling "txt-003" list-003)
(list-filling "txt-004" list-004)
(list-filling "txt-005" list-005)

(set_tile "txt-001" "0")
(set_tile "txt-002" "0")
(set_tile "txt-003" "0")
(set_tile "txt-004" "0")
(set_tile "txt-005" "0")

(action_tile "txt-001"
  (strcat "(list-filling \"txt-002\" list-002)"
					"(list-filling \"txt-003\" list-003)"
					"(list-filling \"txt-004\" list-004)"
					"(list-filling \"txt-005\" list-005)"
  				"(set_tile \"txt-002\" $value)"
          "(set_tile \"txt-003\" $value)"
          "(set_tile \"txt-004\" $value)"
          "(set_tile \"txt-005\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-1-101-04-pwr-unt-elemer)"
  				"(list-filling \"txt-001\" list-001)"
  				"(list-filling \"txt-002\" list-002)"
					"(list-filling \"txt-003\" list-003)"
					"(list-filling \"txt-004\" list-004)"
					"(list-filling \"txt-005\" list-005)"
  );strcat
);action_tile
  
(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-pwr-unt-elemer));if

(if (= type-list "spcf") (spcf-101-04-pwr-unt-elemer));if

(if (= type-list "lecgv") (lecgv-101-04-pwr-unt-elemer));if


(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-1-101-04-pwr-unt-elemer

( / cntr-1 str-001 swtch tmp-str-001 tmp-str-002 tmp-str-003 tmp-str-004 tmp-str-005 tmp-str-spcf)

;заполняем поле "выбрано"
(setq str-001 (get_tile "txt-001");список с номерами выбранных строк
      swtch list-101 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq
  
(setq str-001 (strcat "(" str-001 ")");преобразуем строку в список
      str-001 (read str-001)
);setq

(repeat (length str-001)
  (setq tmp-str-001 (nth (nth cntr-1 str-001) list-001);извлекаем элемент из списка элементов лист-1 по номеру элемента из списка тмп? формируем список обозначений
        tmp-str-002 (nth (nth cntr-1 str-001) list-002)
        tmp-str-003 (nth (nth cntr-1 str-001) list-003)
        tmp-str-004 (nth (nth cntr-1 str-001) list-004)
        tmp-str-005 (nth (nth cntr-1 str-001) list-005)
  );setq

  (setq tmp-str-spcf (list tmp-str-001 (cons 1 tmp-str-002) (cons 2 tmp-str-003) (cons 3 tmp-str-004) (cons 4 tmp-str-005))
  			list-101 (vl-list*  tmp-str-001 list-101);список для поля "выбрано"
  			list-spcf (vl-list*  tmp-str-spcf list-spcf);список характеристик для спецификации
	);setq
  
  (setq cntr-1 (1+ cntr-1);счетчик
  );setq
);repeat

(setq list-spcf (reverse list-spcf);список характеристик для спецификации
);setq

(list-filling "txt-101" (reverse list-101))

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-2-101-04-pwr-unt-elemer

( / cntr-1 pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp-0 (nth 0 (nth cntr-1 list-spcf))
				str-tmp (cdr (nth cntr-1 list-spcf))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 3 str-tmp))
	);setq


 (setvar "osmode" 6199)
 (setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
		 x-pnt-ins (nth 0 pnt-ins)
		 y-pnt-ins (nth 1 pnt-ins)
		 y-pnt-ins-1 y-pnt-ins
 ); setq
 
 (100-empt-lin-le)
 (setvar "cmdecho" 0)
 (setvar "osmode" 0)
 (repeat 3
	 (command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
	 (setq y-pnt-ins-1 (- y-pnt-ins-1 8)
	 );setq
 );repeat
 
 (command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 (strcat "Блок питания Овен " str-tmp-0));наименование
 (command "_text" "_ML" (list (+ (nth 0 pnt-ins) 121) (- (nth 1 pnt-ins) 4)) 2.5 0 (strcat "Вых. напр. =" str-tmp-1 "В"))
 (command "_text" "_ML" (list (+ (nth 0 pnt-ins) 121) (- (nth 1 pnt-ins) 12)) 2.5 0 (strcat "Макс. ток нагр. " str-tmp-2 "А"))
 
 (command "_text" "_MC" (list (+ (nth 0 pnt-ins) 115) (- (nth 1 pnt-ins) 4)) 2.5 0 "***")

	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-3-101-04-pwr-unt-elemer

( / cntr-1 pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp-0 (nth 0 (nth cntr-1 list-spcf))
				str-tmp (cdr (nth cntr-1 list-spcf))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
	);setq
 
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
		 		x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
		 		y-pnt-ins-1 y-pnt-ins
	); setq
	
	(101-empt-lin-spcf)
	(setvar "cmdecho" 0)
	(setvar "osmode" 0)
	(repeat 6
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat
 
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Блок питания");наименование
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 (strcat "- выходное напряжение " str-tmp-1 "В постоянного тока"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 (strcat "- максимальный ток нагрузки " str-tmp-3 "А"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 28)) 2.5 0 (strcat "- количество каналов " str-tmp-2))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 36)) 2.5 0 (strcat "- крепление " str-tmp-4))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 (strcat str-tmp-0))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "Овен, г. Москва");производитель
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins 4)) 2.5 0 "0,5")

	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-4-101-04-pwr-unt-elemer

( / cntr-1 pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp-0 (nth 0 (nth cntr-1 list-spcf))
				str-tmp (cdr (nth cntr-1 list-spcf))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 3 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
			x-pnt-ins (nth 0 pnt-ins)
			y-pnt-ins (nth 1 pnt-ins)
			y-pnt-ins-1 y-pnt-ins
	); setq
 
	(09-empt-lin-le-cgv)
	(setvar "cmdecho" 0)
	(setvar "osmode" 0)
	(repeat 3
		(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
		);setq
	);repeat
 
	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins (- y-pnt-ins 8)))

	(command "_TEXT" "_MC" (list (- x-pnt-ins 7.5) (- y-pnt-ins 4)) 2.5 0 "**")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 4)) 2.5 0 (strcat "Блок питания Овен " str-tmp-0))
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 12)) 2.5 0 (strcat "Uвых. =" str-tmp-1 "В, Iмакс. нагр. " str-tmp-2 "А"))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 130) (- y-pnt-ins 4)) 2.5 0 "**")
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- y-pnt-ins 4)) 2.5 0 "0,5")
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
