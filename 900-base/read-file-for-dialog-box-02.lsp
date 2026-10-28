;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun read-file-for-dialog-box-02

(name-file / cntr-1 cntr-11 file-open list-902 path-file-open str-dscr str-f str-key str-lft str-tmp str-txt tmp-list)

(setq path-file-open (findfile name-file);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
      
      str-f (read-line file-open)
      str-key (substr str-f 1 4)
      str-dscr 1
      cntr-1 1 

      list-902 nil
      list-902-read-file nil
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

(while (/= str-f nil)
	(setq list-902 (reverse list-902)
				tmp-list (cons cntr-1 str-f)
				list-902 (vl-list* tmp-list list-902)
				cntr-1 (1+ cntr-1)
				str-f (read-line file-open)
				list-902 (reverse list-902)
	);setq
);while

(close file-open)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-txt (cdr (nth cntr-1 list-902))
				cntr-11 1
				tmp-list nil
	);setq

	(while (vl-string-search "\\" str-txt)
		(setq tmp-list (reverse tmp-list)
					str-lft (substr str-txt 1 (vl-string-search "\\" str-txt))
					str-txt (substr str-txt (+ (vl-string-search "\\" str-txt) 2));1 \\
					tmp-list (vl-list* str-lft tmp-list)
					tmp-list (reverse tmp-list)
		);setq
	);while

	(setq tmp-list (reverse tmp-list)
				tmp-list (vl-list* str-txt tmp-list)
				tmp-list (reverse tmp-list)

				list-902-read-file (reverse list-902-read-file)
				tmp-list (cons (1+ cntr-1) tmp-list)
				list-902-read-file (vl-list* tmp-list list-902-read-file)
				
				list-902-read-file (reverse list-902-read-file)
				cntr-1 (1+ cntr-1)
	);setq
);repeat

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
