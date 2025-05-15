import AuthMiddleware from '../../components/AuthMiddleware';
import PageWrapper from '../../components/PageWrapper';
import { PageProps } from '../../types/auth';

export default function Home({ auth }: PageProps) {
  return (
    <AuthMiddleware auth={auth}>
      <PageWrapper auth={auth}>
        <div className="flex flex-col items-center justify-center h-screen">
          <h1 className="text-4xl font-bold">Welcome to TravelSpy</h1>
        </div>
      </PageWrapper>
    </AuthMiddleware>
  );
}
