import { Head, Link } from '@inertiajs/react';

interface PageProps {
  auth?: {
    user: {
      email: string;
    } | null;
  };
}

export default function Home({ auth }: PageProps) {
  return (
    <>
      <Head title="Home" />
      <div className="min-h-screen bg-gray-100">
        <div className="py-12">
          <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
              <div className="p-6 text-gray-900">
                <div className="flex justify-between items-center mb-4">
                  <h1 className="text-2xl font-semibold">Welcome to Travel Spy</h1>
                  <Link
                    href="/logout"
                    method="delete"
                    as="button"
                    className="inline-flex items-center px-4 py-2 bg-red-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-red-700 focus:bg-red-700 active:bg-red-900 focus:outline-none focus:ring-2 focus:ring-red-500 focus:ring-offset-2 transition ease-in-out duration-150"
                  >
                    Logout
                  </Link>
                </div>
                {auth?.user ? (
                  <p>Welcome back, {auth.user.email}!</p>
                ) : (
                  <p>Please sign in to continue.</p>
                )}
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
} 