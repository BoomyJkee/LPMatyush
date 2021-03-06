module LabSPO where

calc :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
calc a b = (fst a + fst b, snd a + snd b) -- для положительных чисел

mult :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
mult a b = (fst a * fst b, snd a * snd b) -- для отрицательных чисел

myDiv :: Integer -> Integer -> (Integer, Integer)
myDiv x y | (y == 0) = error "Деление на 0 недопустимо!"

		  | (x < 0 && y < 0) = mult (1, -1) (myDiv (-1 * x) (-1 * y))

		  | (x > 0 && y < 0) = mult (-1, 1) (myDiv x (-1 * y))

		  | (x < 0 && y > 0) = mult (-1, -1) (myDiv (-1 * x) y)

		  | (x < y) = (0, x)

		  | (x >= y) = calc (1, 0) (myDiv (x - y) y)

		  | otherwise = error "Ошибка!"
		  
		  
-- Список используемых источников:
-- https://wiki.livid.pp.ru/students/lambda/index.html
-- https://www.youtube.com/playlist?list=PLoWGNURguz9W5K9_XcmpLcLVTLnv-QG-h
-- https://www.youtube.com/watch?v=7BPQ-gpXKt4&list=PLlb7e2G7aSpRDR44HMNqDHYgrAOPp7QLr
-- lms.mai.ru Курс "Логическое программирование"

-- Тестирование программы представлено в файле ProgramTest.txt