

ap :: Monad m => m (a -> b) -> m a -> m b
ap mf mx = do   f <- mf 
                x <- mx
                return (f x )

ap' :: Monad m => m (a->b) -> m a -> m b
ap' mf mx = do 