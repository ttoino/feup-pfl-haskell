data BST a = Leaf | Node a (BST a) (BST a)

insert :: Ord a => a -> BST a -> BST a
insert x Leaf = Node x Leaf Leaf
insert x (Node y l r)
  | x < y = Node y (insert x l) r
  | x > y = Node y l (insert x r)
  | otherwise = Node y l r

build :: Ord a => [a] -> BST a
build = foldr insert Leaf

mostLeft :: BST a -> a
mostLeft Leaf = error "Empty BST"
mostLeft (Node x Leaf _) = x
mostLeft (Node _ l _) = mostLeft l

-- 4.1
sumBST :: Num a => BST a -> a
sumBST Leaf = 0
sumBST (Node n l r) = n + sumBST l + sumBST r

-- 4.2
list :: BST a -> [a]
list Leaf = []
list (Node n l r) = list l ++ n : list r

-- 4.3
level :: Int -> BST a -> [a]
level 0 (Node n _ _) = [n]
level n (Node _ l r) = level n l ++ level n r
level _ _ = []

-- 4.5
mapBST :: (a -> b) -> BST a -> BST b
mapBST f Leaf = Leaf
mapBST f (Node a l r) = Node (f a) (mapBST f l) (mapBST f r)

-- 4.6 a)
mostRight :: BST a -> a
mostRight Leaf = error "Empty BST"
mostRight (Node x Leaf _) = x
mostRight (Node _ _ r) = mostRight r

-- 4.6 b)
remove :: Ord a => a -> BST a -> BST a
remove x Leaf = Leaf
remove x (Node y Leaf r)
  | x == y = r
remove x (Node y l Leaf)
  | x == y = l
remove x (Node y l r)
  | x < y = Node y (remove x l) r
  | x > y = Node y l (remove x r)
  | otherwise = Node z (remove z l) r
  where
    z = mostRight r
