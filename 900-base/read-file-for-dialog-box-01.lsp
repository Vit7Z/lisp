;/////// ************************************************************************************************************************* //////////////////////////////////////////////
;/////// создание списка строк меню и описания, создание списков данных                                                            //////////////////////////////////////////////
;/////// чтение файла по строкам, разбиение строк по знаку "\" и формирование списков. 1****\2****\ - разбивается на список.       //////////////////////////////////////////////
;/////// 1**** - список 1, 2**** - список 2; list-900-menu - список заголовков, list-900-dscr - список описаний                    //////////////////////////////////////////////
;/////// ************************************************************************************************************************* //////////////////////////////////////////////

(defun read-file-for-dialog-box-01

(name-file num-flds / file-open path-file-open str-f str-key str-lft-01 str-lft-02 str-lft-03 str-lft-04 str-lft-05 str-lft-06 str-lft-07 str-lft-08 str-lft-09 str-lft-10 
str-lft-11 str-lft-12 str-lft-13 str-lft-14 str-lft-15 str-lft-16 str-lft-17 str-lft-18 str-lft-19 str-lft-20 str-tmp)

(setq list-01-read-file nil
			list-02-read-file nil
			list-03-read-file nil
			list-04-read-file nil
			list-05-read-file nil
			list-06-read-file nil
			list-07-read-file nil
      list-08-read-file nil
      list-09-read-file nil
      list-10-read-file nil
      list-11-read-file nil
      list-12-read-file nil
      list-13-read-file nil
      list-14-read-file nil
      list-15-read-file nil
      list-16-read-file nil
      list-17-read-file nil
      list-18-read-file nil
      list-19-read-file nil
      list-20-read-file nil
      
      str-lft-01 nil
      str-lft-02 nil
      str-lft-03 nil
      str-lft-04 nil
      str-lft-05 nil
      str-lft-06 nil
      str-lft-07 nil
      str-lft-08 nil
      str-lft-09 nil
      str-lft-10 nil
      str-lft-11 nil
      str-lft-12 nil
      str-lft-13 nil
      str-lft-14 nil
      str-lft-15 nil
      str-lft-16 nil
      str-lft-17 nil
      str-lft-18 nil
      str-lft-19 nil
      str-lft-20 nil
      
      list-900-menu nil
      list-900-dscr nil

			path-file-open (findfile name-file);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
      
      str-f (read-line file-open)
      str-key (substr str-f 1 4)
);setq


;;;;;;; создание списка для меню
(if (= str-key "menu")
	(progn
		(while (= str-key "menu")
			
			(setq str-tmp (substr str-f 6));setq
							
			(if (= str-tmp "--77") (setq str-tmp " "));if
					
			(setq list-900-menu (vl-list* str-tmp list-900-menu)					
						str-f (read-line file-open)						
						str-key (substr str-f 1 4)
			);setq
		);while	

		(if (/= list-900-menu nil)
			(setq list-900-menu (vl-remove nil list-900-menu)
						list-900-menu (reverse list-900-menu)	
			);setq
		);setq
	);progn
);if


;;;;;;; создание списка для описания
(if (= str-key "dscr")
	(progn
		(while (= str-key "dscr")
	
			(setq str-tmp (substr str-f 6)
						list-900-dscr (vl-list* str-tmp list-900-dscr)					
						str-f (read-line file-open)						
      			str-key (substr str-f 1 4)
			);setq
		);while
	
		(if (/= list-900-dscr nil)
			(setq list-900-dscr (vl-remove nil list-900-dscr)
						list-900-dscr (reverse list-900-dscr)
			);setq
		);if
	);progn
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 1)
	(while (/= str-f nil)
		(setq list-01-read-file (vl-list* str-f list-01-read-file)
						
					str-f (read-line file-open)					
		);setq
	);while
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 2)
	(while (/= str-f nil)
		(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
					str-lft-02 (substr str-f (+ (vl-string-search "\\" str-f) 2));1 \\
					list-01-read-file (vl-list* str-lft-01 list-01-read-file)
					list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						
					str-f (read-line file-open)					
		);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 3)
	(while (/= str-f nil)
		(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));1 \\
					str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))	
					str-lft-03 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
					list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из счит анных строк из файла
					list-02-read-file (vl-list* str-lft-02 list-02-read-file)
					list-03-read-file (vl-list* str-lft-03 list-03-read-file)		
							
					str-f (read-line file-open)
		);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 4)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
					str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
					str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f));седьмые \\
					str-lft-04 (substr str-f (+ (vl-string-search "\\" str-f) 2))
					list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
					list-02-read-file (vl-list* str-lft-02 list-02-read-file)
					list-03-read-file (vl-list* str-lft-03 list-03-read-file)
					list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						
					str-f (read-line file-open)
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 5)
	(while (/= str-f nil)
		(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
					str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
					str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
					str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
					str-lft-05 (substr str-f (+ (vl-string-search "\\" str-f) 2))				
					
					list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
					list-02-read-file (vl-list* str-lft-02 list-02-read-file)
					list-03-read-file (vl-list* str-lft-03 list-03-read-file)
					list-04-read-file (vl-list* str-lft-04 list-04-read-file)
					list-05-read-file (vl-list* str-lft-05 list-05-read-file)

					str-f (read-line file-open)					
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 6)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
					str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
					str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
					str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
					str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
					str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
					str-lft-06 (substr str-f (+ (vl-string-search "\\" str-f) 2))			
						
					list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
					list-02-read-file (vl-list* str-lft-02 list-02-read-file)
					list-03-read-file (vl-list* str-lft-03 list-03-read-file)
					list-04-read-file (vl-list* str-lft-04 list-04-read-file)
					list-05-read-file (vl-list* str-lft-05 list-05-read-file)
					list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						
					str-f (read-line file-open)
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 7)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-07 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 8)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-lft-08 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 9)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-09 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 10)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-10 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 11)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-10 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-11 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						list-11-read-file (vl-list* str-lft-11 list-11-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 12)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-10 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-11 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-12 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						list-11-read-file (vl-list* str-lft-11 list-11-read-file)
						list-12-read-file (vl-list* str-lft-12 list-12-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 13)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-10 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-11 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-12 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-13 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						list-11-read-file (vl-list* str-lft-11 list-11-read-file)
						list-12-read-file (vl-list* str-lft-12 list-12-read-file)
						list-13-read-file (vl-list* str-lft-13 list-13-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 14)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-10 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-11 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-12 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-13 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-14 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						list-11-read-file (vl-list* str-lft-11 list-11-read-file)
						list-12-read-file (vl-list* str-lft-12 list-12-read-file)
						list-13-read-file (vl-list* str-lft-13 list-13-read-file)
						list-14-read-file (vl-list* str-lft-14 list-14-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if


;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////
(if (= num-flds 15)
	(while (/= str-f nil)
			(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
						str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
						str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));четвертые \\
						str-lft-05 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));пятые \\
						str-lft-06 (substr str-f 1 (vl-string-search "\\" str-f))						
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-07 (substr str-f 1 (vl-string-search "\\" str-f))	
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-08 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-09 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-10 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-11 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-12 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-13 (substr str-f 1 (vl-string-search "\\" str-f))
						str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
						str-lft-14 (substr str-f 1 (vl-string-search "\\" str-f))
						str-lft-15 (substr str-f (+ (vl-string-search "\\" str-f) 2))
						
						list-01-read-file (vl-list* str-lft-01 list-01-read-file);создаем список из считанных строк из файла
						list-02-read-file (vl-list* str-lft-02 list-02-read-file)
						list-03-read-file (vl-list* str-lft-03 list-03-read-file)
						list-04-read-file (vl-list* str-lft-04 list-04-read-file)
						list-05-read-file (vl-list* str-lft-05 list-05-read-file)
						list-06-read-file (vl-list* str-lft-06 list-06-read-file)
						list-07-read-file (vl-list* str-lft-07 list-07-read-file)
						list-08-read-file (vl-list* str-lft-08 list-08-read-file)
						list-09-read-file (vl-list* str-lft-09 list-09-read-file)
						list-10-read-file (vl-list* str-lft-10 list-10-read-file)
						list-11-read-file (vl-list* str-lft-11 list-11-read-file)
						list-12-read-file (vl-list* str-lft-12 list-12-read-file)
						list-13-read-file (vl-list* str-lft-13 list-13-read-file)
						list-14-read-file (vl-list* str-lft-14 list-14-read-file)
						list-15-read-file (vl-list* str-lft-15 list-15-read-file)
						
						str-f (read-line file-open)
			);setq
	);while
);if

(close file-open)

(setq list-01-read-file (reverse (vl-remove "" list-01-read-file))
      list-02-read-file (reverse (vl-remove "" list-02-read-file))
      list-03-read-file (reverse (vl-remove "" list-03-read-file))
      list-04-read-file (reverse (vl-remove "" list-04-read-file))
      list-05-read-file (reverse (vl-remove "" list-05-read-file))
      list-06-read-file (reverse (vl-remove "" list-06-read-file))
      list-07-read-file (reverse (vl-remove "" list-07-read-file))
      list-08-read-file (reverse (vl-remove "" list-08-read-file))
      list-09-read-file (reverse (vl-remove "" list-09-read-file))
      list-10-read-file (reverse (vl-remove "" list-10-read-file))
      list-11-read-file (reverse (vl-remove "" list-11-read-file))
      list-12-read-file (reverse (vl-remove "" list-12-read-file))
      list-13-read-file (reverse (vl-remove "" list-13-read-file))
      list-14-read-file (reverse (vl-remove "" list-14-read-file))
      list-15-read-file (reverse (vl-remove "" list-15-read-file))
);setq

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
