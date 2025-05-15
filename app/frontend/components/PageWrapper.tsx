import { Head } from '@inertiajs/react';
import { ReactNode } from 'react';
import Header from './Header';
import { Auth } from '../types/auth';

interface PageWrapperProps {
  children?: ReactNode;
  auth?: Auth;
}

export default function PageWrapper({ children, auth }: PageWrapperProps) {
  return (
    <>
      <Head title="TravelSpy" />
      <div className="min-h-screen bg-gray-100">
        <div className="py-12">
          <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
              <div className="p-6 text-gray-900">
                <Header auth={auth} />
                {children}
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}
