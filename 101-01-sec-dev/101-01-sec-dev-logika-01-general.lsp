;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-secondary-device-logika

( / adoc dcl-id list-001 list-1001 list-1001-read-file list-901 list-902 str-001 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq list-001 (list "АПС43" "АПС78" "АДС90.3" "АДС97") 
      str-001 nil
      list-901 nil
      list-902 nil
      list-1001-read-file nil
);setq

(tmp-strt-101-01-secondary-device-logika)

(if (< (setq dcl-id (load_dialog "dia-101-01-secondary-device-logika.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
    (exit)
  );progn
);if

(if (not (new_dialog "dia_101_secondary_device_logika" dcl-id))
  (exit)
);if

(list-filling "txt-001" list-001)
(list-filling "txt-1001" list-1001)

(set_tile "txt-001" "0")

(action_tile "txt-001"
  (strcat "(tmp-strt-101-01-secondary-device-logika)");strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-secondary-devices-logika)");strcat
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

(cond
	((= type-list "le") (le-101-01-secondary-device-logika));=
	((= type-list "spcf") (spcf-101-01-secondary-device-logika));=
	((= type-list "lecgv") (lecgv-101-01-secondary-device-logika));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-01-secondary-device-logika

( / file-name-1 list-01-read-file)

(if (= nil str-001) 
	(setq str-001 (nth 0 list-001));setq
	(setq str-001 (nth (atoi (get_tile "txt-001")) list-001));setq
);if

(cond
	((= str-001 "АПС43") (setq file-name-1 "101-01-secondary-device-logika-aps-43.txt"));=
	((= str-001 "АПС78") (setq file-name-1 "101-01-secondary-device-logika-aps-78.txt"));=
	((= str-001 "АДС90.3") (setq file-name-1 "101-01-secondary-device-logika-ads-90.txt"));=
	((= str-001 "АДС97") (setq file-name-1 "101-01-secondary-device-logika-ads-97.txt"));=
);cond

(read-file-for-dialog-box file-name-1 1)

(divide-text-into-parts-02-list-text list-01-read-file 60)

(setq list-1001 list-1001-read-file);setq

(list-filling "txt-1001" list-1001)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-secondary-devices-logika

( / str-001 str-002 str-902 str-99 swtch)

(setq str-001 (nth (atoi (get_tile "txt-001")) list-001)
      swtch list-901
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(cond 
	((= str-001 "АПС43") (setq str-99 "0,2"));=
	((= str-001 "АПС78") (setq str-99 "0,2"));=
	((= str-001 "АДС90") (setq str-99 "2"));=
	((= str-001 "АДС97") (setq str-99 "2"));=
);setq

(setq str-902 (list (cons 1 str-001) (cons 2 str-002) (cons 99 str-99))
  		list-902 (vl-list*  str-902 list-902)
  		list-901 (vl-list* (strcat str-001) list-901)
  		list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-secondary-device-logika

( / cntr-1 dlt-y nmbr-ln pnt-ins str-001 str-002 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-001 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-001 "АПС43")
		(setq str-txt (strcat "Адаптер АПС43 (подключение принтеров с интерфейсом Centronics к приборам производства АО НПФ \"ЛОГИКА\")")
					str-txt-01 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-001 "АПС78")
		(progn
		
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Адаптер АПС78 (подключение накопителя АДС90 к приборам")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "типа СПТ или СПГ через оптический порт)")
		);progn
	);if
	
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-001 "АДС90.3")
		(progn

			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Накопитель АДС90.3 (считывание архивных данных из приборов")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "типа СПТ или СПГ, объем памяти 4Мб")
		);progn
	);if

	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-001 "АДС97")
		(progn

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Адаптер измерительный АДС97 (для увеличения числа")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "трубопроводов обслуживаемых приборами типа СПТ или СПГ)")
		);progn
	);if

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////
(defun spcf-101-01-secondary-device-logika

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-001 str-tmp-002 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-001 (cdr (assoc 1 str-tmp))
				str-tmp-002 (cdr (assoc 2 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "1")
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-001 "АПС43")
		(progn
			(setq nmbr-ln 3);setq
		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Адаптер (подключение принтеров с интерфейсом Centronics к приборам")
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "производства ЗАО НПФ \"Логика\")")
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-001)
		);progn
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-001 "АПС78")
		(progn
			(setq nmbr-ln 3);setq
		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Адаптер (подключение накопителя АДС90 к приборам типа СПТ или СПГ")
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "через оптический порт)")
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-001)
		);progn
	);if	
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-001 "АДС90.3")
		(progn
			(setq nmbr-ln 3);setq
		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Накопитель (считывание архивных данных из приборов типа СПТ или СПГ,")
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "объем памяти 4Мб)")
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-001)
		);progn
	);if	
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-001 "АДС97")
		(progn
			(setq nmbr-ln 3);setq
		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Адаптер измерительный (для увеличения числа трубопроводов обслуживаемых")
			(command "_text" "_ML" (list (+ (nth 0 pnt-ins) 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "приборами типа СПТ или СПГ)")
			;
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-001)
			;
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "№ 38646-08");
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "в Госреестре СИ")
		);progn
	);if


	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО НПФ ЛОГИКА,");производитель
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Санкт-Петербург")
	;
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
	;
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins 4)) 2.5 0 str-tmp-99);масса
	
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
