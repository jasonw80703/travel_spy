export interface User {
  id: number;
  email: string;
  username: string;
}

export interface Auth {
  user: User | null;
}

export interface PageProps {
  auth?: Auth;
}
