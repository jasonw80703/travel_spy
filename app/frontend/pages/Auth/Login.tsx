import { useForm } from '@inertiajs/react';
import { FormEvent, useEffect } from 'react';
import { router } from '@inertiajs/react';

interface Props {
  errors?: string[];
  email?: string;
  success?: boolean;
}

export default function Login({ errors: serverErrors, email: serverEmail, success }: Props) {
  const { data, setData, post, processing, errors } = useForm({
    user: {
      email: serverEmail || '',
      password: '',
      remember: false as boolean,
    },
  });

  useEffect(() => {
    if (success) {
      router.visit('/');
    }
  }, [success]);

  const handleSubmit = (e: FormEvent) => {
    e.preventDefault();
    post('/login');
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <h2 className="mt-6 text-center text-3xl font-extrabold text-gray-900">
            Sign in
          </h2>
        </div>
        {serverErrors && serverErrors.length > 0 && (
          <div className="rounded-md bg-red-50 p-4">
            <div className="flex">
              <div className="ml-3">
                <h3 className="text-sm font-medium text-red-800">
                  There were errors with your submission
                </h3>
                <div className="mt-2 text-sm text-red-700">
                  <ul className="list-disc pl-5 space-y-1">
                    {serverErrors.map((error, index) => (
                      <li key={index}>{error}</li>
                    ))}
                  </ul>
                </div>
              </div>
            </div>
          </div>
        )}
        <form className="mt-8 space-y-6" onSubmit={handleSubmit}>
          <div className="rounded-md shadow-sm -space-y-px">
            <div>
              <label htmlFor="email" className="sr-only">
                Email address
              </label>
              <input
                id="email"
                name="email"
                type="email"
                autoComplete="email"
                required
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Email address"
                value={data.user.email}
                onChange={(e) => setData('user.email', e.target.value)}
              />
              {errors['user.email'] && (
                <p className="mt-1 text-sm text-red-600">{errors['user.email']}</p>
              )}
            </div>
            <div>
              <label htmlFor="password" className="sr-only">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="current-password"
                required
                className="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
                placeholder="Password"
                value={data.user.password}
                onChange={(e) => setData('user.password', e.target.value)}
              />
              {errors['user.password'] && (
                <p className="mt-1 text-sm text-red-600">{errors['user.password']}</p>
              )}
            </div>
          </div>

          <div className="flex items-center justify-between">
            <div className="flex items-center">
              <input
                id="remember"
                name="remember"
                type="checkbox"
                className="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
                checked={data.user.remember}
                onChange={(e) => setData('user.remember', e.target.checked)}
              />
              <label htmlFor="remember" className="ml-2 block text-sm text-gray-900">
                Remember me
              </label>
            </div>
          </div>

          <div>
            <button
              type="submit"
              disabled={processing}
              className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {processing ? 'Signing in...' : 'Sign in'}
            </button>
          </div>

          <div className="text-sm text-center">
            <p className="text-gray-600">
              Don't have an account?{' '}
              <a href="/signup" className="font-medium text-indigo-600 hover:text-indigo-500">
                Sign up
              </a>
            </p>
          </div>
        </form>
      </div>
    </div>
  );
}
