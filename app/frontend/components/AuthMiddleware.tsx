import { useEffect } from 'react';
import { router } from '@inertiajs/react';
import { Auth } from '../types/auth';

interface AuthMiddlewareProps {
  auth?: Auth;
  children: React.ReactNode;
}

export default function AuthMiddleware({ auth, children }: AuthMiddlewareProps) {
  useEffect(() => {
    if (!auth?.user) {
      router.visit('/login');
    }
  }, [auth]);

  if (!auth?.user) {
    return null;
  }

  return <>{children}</>;
}
